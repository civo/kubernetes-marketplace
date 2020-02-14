klum - Kubernetes Lazy User Manager
========

### Create User

```yaml
kind: User
apiVersion: klum.cattle.io/v1alpha1
metadata:
  name: darren
```

### Download Kubeconfig

```bash
kubectl get kubeconfig darren -o json | jq .spec > kubeconfig
kubectl --kubeconfig=kubeconfig get all
```

The name of the kubeconfig resource will be the same as the user name

### Delete User

```bash
kubectl delete user darren
```

### Assign Roles

```yaml
kind: User
apiVersion: klum.cattle.io/v1alpha1
metadata:
  name: darren
spec:
  clusterRoles:
  - view
  roles:
  - namespace: default
    # you can assign cluster roles in a namespace
    clusterRole: cluster-admin
  - namespace: other
    # or assign a role specific to that namespace
    role: something-custom
```

If you don't assign a role a default role will be assigned to the user which is
configured on the controller.  The default value is cluster-admin, so change
that if you want a more secure setup.

### Disable user

```yaml
kind: User
apiVersion: klum.cattle.io/v1alpha1
metadata:
  name: darren
spec:
  enabled: false
```

When the user is reenabled a new kubeconfig with new token will be created.