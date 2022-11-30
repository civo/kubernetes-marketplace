## Portainer for kubernetes management

### External access

By default external access to the Portainer isn't available. This is easily changed by applying the following YAML to your cluster with `kubectl apply -f portainer-ingress.yaml` (or whatever you call the file containing the contents below):


```
apiVersion:  networking.k8s.io/v1
kind: Ingress
metadata:
  name: portainer
  namespace: portainer
spec:
  tls:
  - hosts:
      - portainer.<Cluster_ID>.k8s.civo.com
  rules:
  - host: portainer.<Cluster_ID>.k8s.civo.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service: 
            name: portainer
            port: 
              number: 9443
```


This will open up http://portainer.YOUR_CLUSTER_ID.k8s.civo.com to the whole world.
