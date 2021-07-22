## Portainer for kubernetes management

### External access

By default external access to the Portainer isn't available. This is easily changed by applying the following YAML to your cluster with `kubectl apply -f portainer-ingress.yaml` (or whatever you call the file containing the contents below):


```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: portainer
  namespace: portainer
spec:
  rules:
  - host: portainer.$DOMAIN_NAME
    http:
      paths:
      - backend:
          serviceName: portainer
          servicePort: 9000
```


This will open up http://portainer.$DOMAIN_NAME to the whole world.
