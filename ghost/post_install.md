# Ghost

This ghost blog using sqlite as the database backend.

## External Access

An Ingress is created during the installation process. To access your ghost use http://ghost.YOUR_CLUSTER_ID.k8s.civo.com.

## Modify URL

If you want to change the url edit with 

```
kubectl -n ghost edit ingress ghost-blog
```

after that run deployment patch to update the url env in ghost.

First Create file `patch.yaml` using template below :

```yaml
spec:
  template:
    spec:
      containers:
      - name: ghost-blog
        env:
        - name: url
          value: CHANGE_WITH_YOUR_NEW_URL
```

Run the patch command

```
kubectl -n ghost patch deployment ghost-blog --patch "$(cat patch.yaml)"
```
