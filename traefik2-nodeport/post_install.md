# Traefik (v2) - Ingress Controller (NodePort)

Traefik is an open source Edge Router which is usable as an ingress controller for Kubernetes.
It supports both the Kubernetes Ingress object (`networking.k8s.io/v1`) as well as the Traefik provided CRDs (custom resource definitions), which are installed with it.

Traefik is very customizable and can do very much for you, but all of its features can not be covered in this message,
if you wish to find more information, check out the [official documentation](https://doc.traefik.io/traefik/)!

Traefik runs as a DaemonSet on the host network of every node, listening directly on ports 80 and 443.

An IngressClass called `traefik` is installed and marked as the cluster default, so Ingresses either set `ingressClassName: traefik` or leave the class out.

## External access to your services

To expose a standard http service to the external net, you can either use the Kubernetes Ingress object as follows:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: yourapp-ingress
  namespace: default
spec:
  ingressClassName: traefik
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
              number: 80
```

Traefik also includes a CRD called IngressRoute, which would look like this:

```yaml
apiVersion: traefik.io/v1alpha1
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
      match: Host(`www.example.com`)
      services:
        - kind: Service
          name: yourapp-service
          namespace: default
          port: 80
```

Both the `traefik.io` and the older `traefik.containo.us` API groups are supported.

This will open up `http://www.example.com` (assuming you pointed that non-real domain record to your cluster's IPs) to the whole world.

## Metrics and Monitoring

Traefik exposes metrics on port 9910 for Prometheus scraping. To scrape metrics from Traefik, ensure your Prometheus configuration is updated to use port **9910**.
