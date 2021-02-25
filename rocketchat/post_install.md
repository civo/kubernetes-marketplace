## Rocket chat

### External access

By default external access to the Rocket chat isn't available. This is easily changed by applying the following YAML to apply ingress via traefik to your cluster with `kubectl apply -f rocketchat-ingress.yaml` (or whatever you call the file containing the contents below):

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: rocketchat-rocketchat
  annotations:
    kubernetes.io/ingress.class: nginx
  labels:
    app.kubernetes.io/name: rocketchat
    app.kubernetes.io/instance: rocketchat
spec:
  rules:
  - host: rocket.YOUR_CLUSTER_ID.k8s.civo.com
    http:
      paths:
      - path: /
        backend:
          serviceName: rocketchat-rocketchat
          servicePort: http          
```

This will open up http://rocket.YOUR_CLUSTER_ID.k8s.civo.com to the whole world. You should lock this down in the [firewall](https://www.civo.com/account/firewalls) automatically created in Civo for your Kubernetes cluster. Locking down the firewall will only affect access from OUTSIDE of your Kubernetes cluster, access from your applications within Kubernetes will not be affected.

### More

[https://docs.rocket.chat/installation/automation-tools/helm-chart](https://docs.rocket.chat/installation/automation-tools/helm-chart)