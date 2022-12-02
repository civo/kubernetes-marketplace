## Portainer for kubernetes management

### External access

Portainer is exposed using a Civo Load Balancer, so to determine the IP/DNS name, please click on "Cluster Information" and find the Load Balancers section. You can then access Portainer using https://<IP or FQDN>:9443.
You can also check the LB IP it via the cli 
  
```
kubectl get svc -n portainer
NAME        TYPE           CLUSTER-IP    EXTERNAL-IP    PORT(S)                                        AGE
portainer   LoadBalancer   10.43.38.66   212.2.246.73   9000:32452/TCP,9443:32231/TCP,8000:31646/TCP   48s

```

