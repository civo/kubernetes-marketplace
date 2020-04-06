## Portainer for kubernetes management

### External access

By default external access to the Portainer isn't available. This is easily changed by applying the following YAML to your cluster with `kubectl apply -f portainer-ingress.yaml` (or whatever you call the file containing the contents below):


```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: portainer
  namespace: portainer
  annotations:
    kubernetes.io/ingress.class: traefik
spec:
  rules:
  - http:
      paths:
      - path: /
        backend:
          serviceName: portainer
          servicePort: http
```


This will open up https://<masterIP>:<traefik443PORT> to the whole world.
