## Argo Rollouts

### Access Argo Rollouts UI

For viewing the Argo Rollouts Dashboard, you need to have the [Kubectl Argo Rollouts Plugin](https://argoproj.github.io/argo-rollouts/features/kubectl-plugin/) installed on your system.

To port-forward the Argo Rollouts Dashboard:

```bash
kubectl argo rollouts dashboard
```

The Argo Rollout Dashboard can now be accessed from `http://localhost:3100/rollouts`.

### Usage instruction
[Argo Rollouts documentations](https://argo-rollouts.readthedocs.io/en/stable/)
  
### Further reading: 
[Progressive Delivery of Applications on Kubernetes with Argo Rollouts and Argo CD](https://www.civo.com/learn/progressive-delivery-of-applications)
