## Kubeless

### UI External access

By default external access to the Kubeless UI isn't available. This is easily changed by applying the following YAML to your cluster with `kubectl apply -f kubeless-ingress.yaml` (or whatever you call the file containing the contents below):


```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: ui
  namespace: kubeless
  annotations:
    kubernetes.io/ingress.class: traefik
spec:
  rules:
  - host: ui.kubeless.<clusterDomainName>
    http:
      paths:
      - path: /
        backend:
          serviceName: ui
          servicePort: ui-port
```


This will open up `http://ui.kubeless.<clusterDomainName>` to the whole world.

### Functions External access

By default external access to the functions isn't available. This is easily changed by applying the following YAML to your cluster with `kubectl apply -f kubeless-functions-ingress.yaml` (or whatever you call the file containing the contents below):


```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: functions
  namespace: default
  annotations:
    kubernetes.io/ingress.class: traefik
spec:
  rules:
  - host: functions.default.<clusterDomainName>
    http:
      paths:
      - path: /<functionName1>
        backend:
          serviceName: <functionName1>
          servicePort: 8080
      - path: /<functionName2>
        backend:
          serviceName: <functionName2>
          servicePort: 8080
```

This will open up

* `http://functions.default.<clusterDomainName>/<functionName1>`
* `http://functions.default.<clusterDomainName>/<functionName2>`

to the whole world.

#### Update
The same creation `apply` command can be used to update ingress configuration after adding a new function path.
