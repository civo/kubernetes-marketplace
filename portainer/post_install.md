## Portainer for kubernetes management

### Access

Portainer is not exposed to the internet. Forward its port to your machine:

```
kubectl -n portainer port-forward svc/portainer 9443:9443
```

Then open https://localhost:9443 (accept the self-signed certificate) and log in as `admin` with the generated password `${ADMIN_PASSWORD}` (shown above).

You can read the password again with:

```
kubectl -n portainer get secret portainer-admin -o jsonpath='{.data.password}' | base64 -d
```

To expose Portainer to others, put it behind an authenticated Ingress or load balancer of your own.

### Permissions

Portainer manages workloads, services, config maps, secrets, volumes and namespaces in every namespace, but it cannot create or change RBAC objects (roles, role bindings), custom resource definitions or webhooks. Helm charts that include those need to be applied with `kubectl` using your own admin kubeconfig.
