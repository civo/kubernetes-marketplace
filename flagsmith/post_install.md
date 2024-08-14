## Flagsmith

With Flagsmith, release features with confidence; manage feature flags across web, mobile, and server side applications

### External Access

By default the external access isn't available.
Now to access Flagsmith using port-forwarding, run:
`kubectl -n flagsmith port-forward svc/flagsmith-frontend 8080:8080`

A LoadBalancer can also be deployed to serve the app via the cluster IP.
To do this, apply the following YAML to your cluster with `kubectl apply -f flagsmith-service.yaml` 
or whatever name given to the YAML file.

```yaml
apiVersion: v1
kind: Service
metadata:
  namespace: flagsmith
  name: flagsmith-loadbalancer
spec:
  type: LoadBalancer
  ports:
  - port: 8080
    targetPort: 8080
    protocol: TCP
  selector:
    app.kubernetes.io/component: frontend
```

This will provision a [Civo Load Balancer](https://www.civo.com/load-balancers) (with some additional charges).

Now this Service will open the flagsmith dashboard on `YOUR_CLUSER_ID.k8s.civo.com:3000` (Cluster ID can be found on [Civo Dashboard](https://dashboard.civo.com/)) or on an external ip of the service which can be found using 
`kubectl get svc flagsmith-loadbalancer -n flagsmith -o yaml | grep ip`. This will expose the service to world but you must set firewalls rules to secure this service from outside.

### Docs

After deploying the loadbalancer, you can follow the [Quick Start](https://docs.flagsmith.com/quickstart) guide to get up and running with [Flagsmith](https://www.flagsmith.com/).
