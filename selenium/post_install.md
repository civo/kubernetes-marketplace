## Selenium

This is a ready Selenium hub with Chrome node

### External access

By default external access to the Selenium hub to connect external nodes or to reach web console is disabled. This is easily changed by applying the following YAML to apply ingress via traefik to your cluster with `kubectl apply -f selenium-ingress.yaml` (or whatever you call the file containing the contents below):

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: selenium-hub-ingress
spec:
  rules:
  - host: selenium.<your-cluster-id>.k8s.civo.com
    http:
      paths:
      - backend:
          serviceName: selenium-hub
          servicePort: 4444
```

### Usage instruction

Go to `http://selenium.<your-cluster-id>.k8s.civo.com` to access console
Just add `http://selenium.<your-cluster-id>.k8s.civo.com` as your webdriver remote url for your test scripts. 

### Scaling (experimental)

You might scale the amount of Selenium Chrome nodes with :
`kubectl scale --replicas=<amount> deployment/selenium-node-chrome`
but be careful not to overload your cluster. Adapt the size or scale your Civo cluster accordingly (2GB per Selenium node).  
