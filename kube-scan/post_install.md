## Using kube-scan

### Usage instruction

We use `kubectl port-forward` to expose kube-scan UI.
```
kubectl port-forward --namespace kube-scan svc/kube-scan-ui 8080:80
```
Now access the kube-scan UI at `http://localhost:8080`

To know more, check the [official guide](https://github.com/octarinesec/kube-scan).
