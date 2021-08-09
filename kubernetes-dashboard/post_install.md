## Kubernetes Dashboard

### Accessing the dashboard

In order to access the dashboard, you must obtain the bearer token for the admin service account. To do this, run the following command:

```
kubectl -n kubernetes-dashboard describe secret admin-user-token | grep ^token
```

Once you have that token, you can do a port forward by running:

```
kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard  8000:443

```

The dashboard will now be accessible at the following url:

https://localhost:8000/

To access it, enter the token you obtained by selecting "Sign In" and "Bearer Token".

You will now have access to the dashboard!
