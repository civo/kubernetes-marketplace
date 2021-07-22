## Rancher - with Civo k3s cluster imported

### External access

By default external access to the Rancher isn't available. This is easily changed by applying the following YAML to your cluster with `kubectl apply -f rancher-ingress.yaml` (or whatever you call the file containing the contents below):

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: cattle-ingress
  namespace: cattle-system
  annotations:
    kubernetes.io/ingress.class: traefik
spec:
  rules:
  - host: rancher.$DOMAIN_NAME
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
             name: cattle-service
             port:
               name: http
```

If you are using a NGINX ingress, simply change `kubernetes.io/ingress.class` to `nginx`.

This will open up https://<masterIP>:<traefik443PORT> to the whole world.
