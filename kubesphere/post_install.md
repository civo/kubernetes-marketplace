## KubeSphere

### Check the installation

You can inspect the logs of installation.

```
kubectl logs -n kubesphere-system $(kubectl get pod -n kubesphere-system -l app=ks-install -o jsonpath='{.items[0].metadata.name}') -f
```

When all Pods of KubeSphere are running, it means the installation is successful.

### Set the admin password

The console is not exposed to the internet. The `admin` account is created by the installer once it has finished, and starts with the upstream default password, so set your own password first. Once the installation has finished, run:

```
kubectl patch users.iam.kubesphere.io admin -p '{"spec":{"password":"${ADMIN_PASSWORD}"}}' --type=merge
kubectl annotate users.iam.kubesphere.io admin iam.kubesphere.io/password-encrypted-
```

This sets the generated password shown above (`${ADMIN_PASSWORD}`) for the `admin` user. Change it again from the console after logging in.

### Login the console of KubeSphere

Forward the console port to your machine:

```
kubectl -n kubesphere-system port-forward svc/ks-console 30880:80
```

Then open http://localhost:30880 and log in as `admin` with the password you set above.

To expose the console to others, put it behind an authenticated Ingress or load balancer of your own. For port requirements between components, see the document of [port-firewall](https://kubesphere.io/docs/v3.3/installing-on-linux/introduction/port-firewall/).
