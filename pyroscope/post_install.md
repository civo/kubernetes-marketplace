## Pyroscope — open source continuous profiling platform

### External access

By default external access to the Pyroscope port (4040) isn't available. You can either set up port forwarding with this command:
```
kubectl -n pyroscope port-forward svc/pyroscope-server 4040:4040
```

Or install an ingress by applying the following YAML to your cluster with `kubectl apply -f pyroscope-server-ingress.yaml` (Make sure to replace `YOUR_CLUSTER_ID` with the actual cluster ID):

```
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    kubernetes.io/ingress.class: traefik
  labels:
    app: pyroscope-server
  name: pyroscope-server-ingress
  namespace: pyroscope
spec:
  rules:
    - host: pyroscope-server.YOUR_CLUSTER_ID.k8s.civo.com
      http:
        paths:
          -
            backend:
              service:
                name: pyroscope-server
                port:
                  number: 4040
            path: /
            pathType: "Prefix"
```

This will open up http://pyroscope-server.YOUR_CLUSTER_ID.k8s.civo.com to the whole world.

#### Sending profiling data from apps to pyroscope server

When you're setting up your applications to send data to pyroscope, set server address to `http://pyroscope-server:4040`.

### Additional Documentation

For more information on how to use Pyroscope, check out the [documentation](https://grafana.com/docs/pyroscope/latest/).
