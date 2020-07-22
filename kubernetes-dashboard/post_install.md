## Kubernetes Dashboard

### Accessing the dashboard

In order to access the dashboard, you must obtain the bearer token for the admin service account. 

To do this, you must first create the admin-user using the following yaml file:

```
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard

```

Apply with:

```
kubectl apply -f admin-user.yaml
```

Then, create the Cluster Role Binding for this user to allow access to the kubernetes dashboard with this yaml file:

```
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
```
And apply the spec:

```
kubectl apply -f admin-user-crb.yaml
```

Then, run the following command:

```
kubectl -n kubernetes-dashboard describe secret admin-user-token | grep ^token
```

Once you have that token, you can proxy into the cluster by running:

```
kubectl proxy
```

The dashboard will now be accessible at the following url:

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

To access it, enter the token you obtained by selecting "Sign In" and "Bearer Token".

You will now have access to the dashboard!
