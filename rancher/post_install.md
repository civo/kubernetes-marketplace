## Rancher - with Civo k3s cluster imported

### External access

By default external access to the Rancher isn't available. This is easily changed by applying the following YAML to your cluster with `kubectl apply -fRancher-ingress.yaml` (or whatever you call the file containing the contents below):


```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: cattle-ingress
  namespace: cattle-system
  annotations:
    kubernetes.io/ingress.class: traefik
spec:
  rules:
  - http:
      paths:
      - path: /
        backend:
          serviceName: cattle-service
          servicePort: http
```


This will open up https://<masterIP>:<traefik443PORT> to the whole world.
