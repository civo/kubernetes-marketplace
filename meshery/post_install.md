## Meshery

### Verify Deployment Health

After installing Meshery, you can verify the health of your Meshery deployment using:

```
mesheryctl system check
```

### Accessing Meshery UI

After successful deployment, you can access Meshery's web-based user interface. There are several ways to access the Meshery UI:

1. Using mesheryctl (recommended):
   ```
   mesheryctl system dashboard
   ```

2. Using port-forward for Kubernetes deployments:
   ```
   mesheryctl system dashboard --port-forward
   ```

   Alternatively, you can use kubectl:
   ```
   kubectl port-forward svc/meshery 9081:9081 --namespace meshery
   ```

The default location for Meshery UI is http://localhost:9081

### Verify Kubernetes Connection

After installation, verify that your kubeconfig is properly configured:

1. Navigate to **Lifecycle** in the Meshery UI
2. Click on **Connections**
3. Verify your cluster appears in the connections list and is marked as `Connected`
4. Click on the cluster name to perform a ping test

### Further Reading

* [Meshery Documentation](https://docs.meshery.io/)
* [Production Deployments](https://docs.meshery.io/installation/kubernetes/helm#post-installation-steps)
