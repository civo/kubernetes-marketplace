## Kubesphere

### Login the console of kubesphere

You can inspect the logs of installation.

```
kubectl logs -n kubesphere-system $(kubectl get pod -n kubesphere-system -l app=ks-install -o jsonpath='{.items[0].metadata.name}') -f
```

When all Pods of KubeSphere are running, it means the installation is successful. Check the port (30880 by default) of the console service by the following command. 

```
kubectl get svc/ks-console -n kubesphere-system
```
Then you can use http://IP:30880 to access the console with the default account admin/P@88w0rd.
