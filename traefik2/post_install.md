## Traefik (v2) - Ingress Controller

Traefik is a open source Edge Router which is usable as a ingress controller for kubernetes.  
It supports both the kubernetes Ingress object (`extensions/v1beta1`) as well as the traefik provided CDRs (custom resource definition).

Trafik is very customizable and can do very much for you, but all of its features can not be covered in this message,
if you wish to find more information, check out the [official documentation](https://doc.traefik.io/traefik/)!

### External access to your services

To expose a standard http service to the external net, you can either use the kubernetes internal Ingress object as follows:

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: yourapp-ingress
  namespace: default
  annotations:
    kubernetes.io/ingress.class: traefik
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

Traefik also includes a CDR called IngressRoute, which would look like this:

```
apiVersion: traefik.containo.us/v1alpha1
kind: IngressRoute
metadata:
  name: yourapp-ingress
  namespace: default
spec:
  entryPoints:
    - web
    - websecure
  routes:
    - kind: Rule
      match: (Path(`/`)
      services:
        - kind: Service
          name: yourapp-service
          namespace: default
          port: http
```

This will open up http://www.example.com (assuming you pointed that non-real domain record to your cluster's IPs) to the whole world.


Port 80 and 443 are both exposed through a `LoadBalancer` service, with the help of [cert-manager](https://cert-manager.io/) you can
issue your own TLS/SSL certificates for your domains, by default, Traefik generates a self-signed certificate for the
websecure endpoint (443). 
