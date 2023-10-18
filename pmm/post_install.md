## Percona Monitoring and Management - DBaaS will kave your civo kubernetes cluster registered already

### External access

By default PMM is exposed through a Load Balancer.

Get the IP-address of the Load Balancer:

```
  export SERVICE_IP=$(kubectl get svc monitoring-service -o jsonpath="{.status.loadBalancer.ingress[0].ip}")
  echo https://$SERVICE_IP
```

Connect to the link you get from the above.
