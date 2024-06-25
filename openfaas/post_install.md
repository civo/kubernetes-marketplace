## OpenFaaS

Thank you for deploying [OpenFaaS](https://github.com/openfaas/faas) to Civo's k3s service.

### Obtain access

The OpenFaaS gateway has been made available through a `NodePort` on port `31112` on each node.

* Go to your Civo dashboard, click Kubernetes and then your OpenFaaS Cluster.

Look for the DNS entry that you find there, it may look something like `6c1c1646-25cf-44f0-9bd5-53ee35cd7c84.k8s.civo.com`

This DNS record which points at each of the nodes in your cluster.

* Set the following URL:

```sh
export DNS="" # As per dashboard
export OPENFAAS_URL=http://$DNS:31112
```

### Get your kubeconfig

Pick A or B:

* A) Get your kubeconfig via command-line

    ```sh
    civo k8s ls

    civo k8s kubeconfig --save <CLUSTER_NAME>

    kubectl config set-context <CLUSTER_NAME>
    ```

* B) Get your kubeconfig via the Dashboard

    Download your `kubeconfig` file from the Civo dashboard.

    Now set the `KUBECONFIG` environment variable, so that you point at your new cluster:

    ```
    export KUBECONFIG=$HOME/Downloads/config-file.yaml
    ```

### Find your generated password

You can find your password above and save it as `password.txt`.

Alternative, retrieve the password using `kubectl`:

```
echo $(kubectl get secret -n openfaas basic-auth -o jsonpath="{.data.basic-auth-password}" | base64 --decode; echo) > password.txt
```

### Use the CLI to log in

Now install the [faas-cli](https://github.com/openfaas/faas-cli) and log in:

```
cat password.txt | faas-cli login --username admin --password-stdin
```

### Deploy a test function

```
faas-cli store list

# Find one you like

faas-cli store deploy nodeinfo

# List your functions

faas-cli list --verbose

# Check when the function is ready

faas-cli describe nodeinfo

Name:                nodeinfo
Status:              Ready

# Invoke the function using the URL given above, or via `faas-cli invoke`

echo | faas-cli invoke nodeinfo
echo -n "verbose" | faas-cli invoke nodeinfo
```

### Access the OpenFaaS Gateway UI

You can now use the DNS entry you found earlier in a web-browser to access your dashboard.

```sh
echo $OPENFAAS_URL
```

## Next steps

* Read the docs: [Deploy TLS with LetsEncrypt to enable HTTPS](https://docs.openfaas.com/reference/tls-openfaas/)
* Learn OpenFaaS: [Try The Official Workshop](https://github.com/openfaas/workshop)
* Get help: Join the [OpenFaaS Community](https://docs.openfaas.com/community/)
