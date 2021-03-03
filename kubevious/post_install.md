## Kubevious Helm chart will deploy the ingress as well and the dashboard can be accessed via traefik port

apply the ingress with below contents for external access 

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: kubevious
  namespace: kubevious
spec:
  rules:
  - host: kubevious.<your-cluster-id>.k8s.civo.com
    http:
      paths:
      - backend:
          serviceName: kubevious-ui-nodeport
          servicePort: 80
          
```
This will open up http://kubevious.YOUR_CLUSTER_ID.k8s.civo.com to the whole world.

       
