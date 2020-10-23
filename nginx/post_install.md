## Nginx ingress controller

### External access to your services

ingress-nginx is an Ingress controller for Kubernetes using NGINX as a reverse proxy and load balancer. To use it for your applications all you have to do is apply a YAML file like the one below to handle ingress:

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: yourapp-ingress
  namespace: default
  annotations:
    kubernetes.io/ingress.class: "nginx"
spec:
  rules:
  - host: www.example.com
    http:
      paths:
      - path: /
        backend:
          serviceName: yourapp-service
          servicePort: http
```

This will open up http://www.example.com (assuming you pointed that non-real domain record to your cluster's IPs) to the whole world.

