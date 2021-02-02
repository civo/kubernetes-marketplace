## Kubenav

### Accessing the dashboard

The Kubenav UI is only accessible inside the cluster via its ClusterIP

so you need to proxy into the cluster by running:

```
kubectl port-forward --namespace kubenav svc/kubenav 14122
```

The Kubenav UI will now be accessible at the following url:

http://localhost:14122
