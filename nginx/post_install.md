## Nginx ingress controller

### External access to your services

ingress-nginx is an Ingress controller for Kubernetes using NGINX as a reverse proxy and load balancer. To use it for your applications all you have to do is apply a YAML file like the one below to handle ingress:

```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: yourapp-ingress
  namespace: default
spec:
  ingressClassName: nginx # Ingress controller name
  rules:
  - host: www.example.com
    http:
      paths:
        - path: /
          pathType: Prefix
          backend:
            service:
              name: yourapp-service
              port:
                number: 80 # Your service port number
```

This will open up http://www.example.com (assuming you pointed that non-real domain record to your cluster's IPs) to the whole world.

