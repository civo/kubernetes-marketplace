## Tekton

### Dashboard Access

By default external access to the Dashboard isn't available. It can be make accessible via an Ingress to your cluster with the command below

```sh
cat - | kubectl apply -f - <EOF
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: tekton-ingress
  namespace: tekton-pipelines
spec:
  rules:
  - host: tekton.your-cluster-id.k8s.civo.com
    http:
      paths:
      - backend:
          serviceName: tekton-dashboard
          servicePort: 9097
EOF
```

This will open up http://tekton.YOUR_CLUSTER_ID.k8s.civo.com to the whole world. You should lock this down in the [firewall](https://www.civo.com/account/firewalls) automatically created in Civo for your Kubernetes cluster. Locking down the firewall will only affect access from OUTSIDE of your Kubernetes cluster, access from your applications within Kubernetes will not be affected.

### Usage instruction

TODO: Write up instructions for basic pipeline