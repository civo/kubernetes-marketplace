## Metrics Server

Metrics Server - provide metrics for Kubernetes HPAv2 (Pod auto-scaling)

### Test Metrics Server out

Check that data is being received from nodes:

```
kubectl get --raw "/apis/metrics.k8s.io/v1beta1/nodes"
```

Check node usage:

```sh
kubectl top node
```

Check node usage:

```sh
kubectl top pod --all-namespaces
```

### Usage instruction

See the Kubernetes documentation for a worked-example of how to use HPAv2.

[Horizontal Pod Autoscaler](https://kubernetes.io/docs/tasks/debug/debug-cluster/resource-metrics-pipeline/)
