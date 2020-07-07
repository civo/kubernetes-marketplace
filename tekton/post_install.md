## Tekton

This marketplace application installs three components of the Tekton Suite.  Those are the core Pipeline, along with Triggers and the Dashboard.  

### Usage Instructions

- [Getting Started](https://tekton.dev/docs/getting-started/)
- [Full Documentation](https://tekton.dev/docs/)
- [Triggers](https://tekton.dev/docs/triggers/)
- [Dashboard](https://tekton.dev/docs/dashboard/)

### Dashboard Access

By default external access to the Tekton Dashboard isn't available.  As there is no built-in authentication method, it should not be exposed
via an Ingress without additional authentication methods in place.  To easily and securly access the dashboard, use port forwarding, which will make the dashboard available at <http://localhost:9097>

```sh
kubectl --namespace tekton-pipelines port-forward svc/tekton-dashboard 9097:9097
```

### Exposing Trigger EventListeners

Incoming triggers can be exposed through an Ingress.  [The core instructions](https://tekton.dev/docs/triggers/exposing-eventlisteners/) can be used with the following modifications:

1. Skip step one under "Using Nginx Ingress", as the Traefik ingress should work
2. Obtain the eventlister with a `kubectl get el <EVENTLISTENR_NAME> -o=jsonpath='{.status.configuration.generatedName}'` command
3. With the service name, create an ingress as below:
   ```yaml
    apiVersion: extensions/v1beta1
    kind: Ingress
    metadata:
      name: ingress-resource
      namespace: getting-started
    spec:
      rules:
        - http:
          host: eventlistenername.your-cluster-id.k8s.civo.com
            paths:
              - path: /
                backend:
                  serviceName: getting-started-listener-b8rqz # REPLACE WITH YOUR SERVICE NAME FROM STEP 2
                  servicePort: 8080
   ```

This will open up http://eventlistenername.YOUR_CLUSTER_ID.k8s.civo.com to trigger the service.  Ensure your eventlistener has the necessary interceptor configuration in place to prevent unauthorized triggering of the pipeline.