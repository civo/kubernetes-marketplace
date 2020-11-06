## RabbitMQ

### External access

By default external access to the RabbitMQ port isn't available. This is easily changed by applying the following YAML to your cluster with `kubectl apply -f rabbit-mq.yaml` (or whatever you call the file containing the contents below):

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: rabbitmq
  namespace: default
  annotations:
    kubernetes.io/ingress.class: traefik
spec:
  rules:
  - host: rabbit.<clusterDomainName>
    http:
      paths:
      - path: /
        backend:
          serviceName: rabbitmq
          servicePort: 15672
```

This will open up http://rabbit.<clusterDomainName> to the whole world. You should lock this down in the [firewall](https://www.civo.com/account/firewalls) automatically created in Civo for your Kubernetes cluster. Locking down the firewall will only affect access from OUTSIDE of your Kubernetes cluster, access from your applications within Kubernetes will not be affected.

### Usage instructions

Default username : guest
Default password : guest

Note: Don't forget the change default username and password or lock down url with firewall.
