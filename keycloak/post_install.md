## Keycloak

Add authentication to applications and secure services with minimum effort.
No need to deal with storing users or authenticating users.

Keycloak provides user federation, strong authentication, user management, fine-grained authorization, and more.

### External access

Use ingress to expose the keycloak deployment. This is easily changed by applying the following YAML to apply ingress via traefik or nginx:

```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: keycloak
spec:
  tls:
    - hosts:
      - KEYCLOAK_HOST
  rules:
  - host: KEYCLOAK_HOST
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: keycloak
            port:
              number: 8080
```

### Usage instruction

Go to `[http://selenium.<your-cluster-id>.k8s.civo.com](https://www.keycloak.org/getting-started/getting-started-kube)` for more details

