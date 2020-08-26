## Using Polaris

### Usage instruction

We use `kubectl port-forward` to expose Polaris UI.
```
kubectl port-forward --namespace polaris svc/polaris-dashboard 8080:80
```
Now access the Polaris UI at `http://localhost:8080`

To know more how to use it, check this [civo learning guide for polaris](https://www.civo.com/learn/setting-up-polaris-on-k8s).
