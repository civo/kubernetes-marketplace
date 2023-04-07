## Uptime-Kuma

### Accessing the UI Frontend

Uptime-Kuma comes with a nice UI where you can add your domains to monitor.
To access it you need to install a Kubernetes Ingress Controller like [Nginx](https://www.civo.com/marketplace/Nginx).

Next create the Kubernetes Manifest for the Ingress resource and apply it.
Here an example for [Nginx](https://www.civo.com/marketplace/Nginx):

```sh
cat <<EOF | kubectl -n uptime-kuma apply -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: uptime-kuma-ingress
  annotations:
    kubernetes.io/ingress.class: nginx
spec:
  rules:
  - host: uptime.<MY_CIVO_CLUSTER_DNS_NAME>
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
             name: uptime-kuma
             port:
               number: 3001
EOF
```
