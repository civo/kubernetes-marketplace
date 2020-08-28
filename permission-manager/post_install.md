## Using Permission Manager

### Usage instructions

Use `kubectl port-forward` to expose Permission Manager UI.
```
kubectl port-forward --namespace permission-manager svc/permission-manager 4000:4000
```
Now access the Permission Manager UI at `http://localhost:4000`

You will be prompted for username and password. Use `admin` as username and get the password from below command.
```
kubectl get secret -n permission-manager permission-manager -o=jsonpath='{.data.BASIC_AUTH_PASSWORD}' | base64 --decode
```
To know more how to use it, check their [official guide](https://github.com/sighupio/permission-manager).
