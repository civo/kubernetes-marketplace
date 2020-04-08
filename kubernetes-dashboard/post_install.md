## Kubernetes Dashboard

### Accessing the dashboard

In order to access the dashboard, you must obtain the bearer token for the admin service account. To do this, run the following command:

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
