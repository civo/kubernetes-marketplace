## Selenium

### External access

By default external access to the Selenium hub to connect external nodes or web console is disabled. This is easily changed by applying the following YAML to apply ingress via traefik to your cluster with `kubectl apply -f selenium-ingress.yaml` (or whatever you call the file containing the contents below):

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: selenium-hub-ingress
spec:
  rules:
  - host: selenium.your-cluster-id.k8s.civo.com
    http:
      paths:
      - backend:
          serviceName: selenium-hub
          servicePort: 4444
```

### Usage instruction
