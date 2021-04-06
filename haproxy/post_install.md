## Haproxy - Ingress controller

### External access to your services

HAProxy is free, open source software that provides a high availability load balancer and proxy server for TCP and HTTP-based applications. To use it for your applications all you have to do is apply a YAML file like the one below to handle ingress:

```yaml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: your-app-ingress
  namespace: default
spec:
  rules:
  - host: www.example.com
    http:
      paths:
      - path: /
        backend:
          serviceName: service-name
          servicePort: 8080
```

This will open up http://www.example.com (assuming you pointed that non-real domain record to your cluster's IPs) to the whole world.
