## Hashicorp Vault

### Security Warning

By default, the chart runs in standalone mode. This mode uses a single Vault server with a file storage backend. This is a less secure and less resilient installation that is NOT appropriate for a production setup. It is highly recommended to use a [properly secured Kubernetes cluster](https://kubernetes.io/docs/tasks/administer-cluster/securing-a-cluster/), [learn the available configuration options](https://www.vaultproject.io/docs/platform/k8s/helm/configuration), and read the [production deployment checklist](https://www.vaultproject.io/docs/platform/k8s/helm/run#architecture).

Source: https://www.vaultproject.io/docs/platform/k8s/helm#using-the-helm-chart

### Post installation configuration

After installing Hashicorp Vault on your [Civo K3S Cluster](https://www.civo.com/) you need to [initialize the Vault server](https://www.vaultproject.io/docs/commands/operator/init).
This generates all needed data and prints out the [unseal keys](https://www.vaultproject.io/docs/concepts/seal)
and the [root token](https://www.vaultproject.io/docs/concepts/tokens#root-tokens).

Additionally you have to make sure that you have the [Vault binary installed locally](https://www.vaultproject.io/downloads) on your workstation.

Wait until the Vault Pod is created:

```sh
kubectl --namespace vault get pods -l app.kubernetes.io/name=vault --field-selector=status.phase==Running

NAME      READY   STATUS    RESTARTS   AGE
vault-0   0/1     Running   0          4m12s
```

Next either port-forward the Vault port to your local Workstation or attach the remote shell

```sh
# Port-forward Vault port
kubectl --namespace vault port-forward pod/vault-0 8200:8200
Forwarding from 127.0.0.1:8200 -> 8200
Forwarding from [::1]:8200 -> 8200
...

# Attach to remote shell
kubectl --namespace vault exec -it pod/vault-0 -- ash
/ $
```

If you used port-forwarding, please open a new Terminal window, else you can just continue inside the shell of your Pod.

```sh
export VAULT_ADDR="http://127.0.0.1:8200"

# The output should look like following
vault status
Key                Value
---                -----
Seal Type          shamir
Initialized        false
Sealed             true
Total Shares       0
Threshold          0
Unseal Progress    0/0
Unseal Nonce       n/a
Version            1.7.3
Storage Type       file
HA Enabled         false
```

Now we initialize the Vault installation.

**Important:** Please make sure to save the unseal keys and the root token to a secure space, because they are needed for further operation of the Vault application.

```sh
vault operator init

Unseal Key 1: <A-PART-OF-THE-UNSEAL-KEY>
Unseal Key 2: <A-PART-OF-THE-UNSEAL-KEY>
Unseal Key 3: <A-PART-OF-THE-UNSEAL-KEY>
Unseal Key 4: <A-PART-OF-THE-UNSEAL-KEY>
Unseal Key 5: <A-PART-OF-THE-UNSEAL-KEY>

Initial Root Token: <YOUR-INITIAL-ROOT-TOKEN>

Vault initialized with 5 key shares and a key threshold of 3. Please securely
distribute the key shares printed above. When the Vault is re-sealed,
restarted, or stopped, you must supply at least 3 of these keys to unseal it
before it can start servicing requests.

Vault does not store the generated master key. Without at least 3 key to
reconstruct the master key, Vault will remain permanently sealed!

It is possible to generate new unseal keys, provided you have a quorum of
existing unseal keys shares. See "vault operator rekey" for more information.
```

Last we unseal the [Vault Barrier](https://www.vaultproject.io/docs/internals/architecture#high-level-overview).
We have to do this step 3 times with 3 different unseal keys.

```sh
# First unseal key
vault operator unseal
Unseal Key (will be hidden): <ENTER-YOUR-FIRST-PART-OF-THE-UNSEAL-KEY>

# Second unseal key
vault operator unseal
Unseal Key (will be hidden): <ENTER-YOUR-SECOND-PART-OF-THE-UNSEAL-KEY>

# Third unseal key
vault operator unseal
Unseal Key (will be hidden): <ENTER-YOUR-THIRD-PART-OF-THE-UNSEAL-KEY>
```

Now the initial configuration of Hashicorp Vault is complete.

### Accessing the UI Frontend

Vault comes with a nice UI where you can do most of the management instead of using the terminal.
To access it you need to install a Kubernetes Ingress Controller like Nginx or [HAProxy](https://www.civo.com/learn/install-haproxy-as-ingress-in-civo-kubernetes).

Next create the Kubernetes Manifest for the Ingress resource and apply it.

```sh
cat <<EOF | kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: vault-ingress
  annotations:
    kubernetes.io/ingress.class: nginx
spec:
  rules:
  - host: vault.<MY_CIVO_CLUSTER_DNS_NAME>
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
             name: vault
             port:
               number: 8200
EOF
```
