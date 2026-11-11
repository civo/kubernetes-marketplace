## Selenium

This is a ready Selenium hub with a Chrome node.

The hub is **not exposed to the internet**: it has no login, so anyone who could reach it could control a browser inside your cluster. It is only reachable from inside the cluster.

### Usage instruction

Open the console and use it as your WebDriver remote URL from your machine with a port-forward:

```
kubectl -n selenium port-forward svc/selenium-hub 4444:4444
```

Then go to `http://localhost:4444` to open the console, and use `http://localhost:4444` as the remote WebDriver URL in your test scripts.

From other pods in the same cluster use `http://selenium-hub.selenium.svc.cluster.local:4444`.

### Exposing it publicly (not recommended)

Only do this if you really need it, and always put authentication in front of it (for example an Ingress with basic auth or an IP allow list). Never expose the hub without it.

### Updating browser version

Just redeploy the Selenium node(s) with `kubectl -n selenium rollout restart deployment/selenium-node-chrome`

### Scaling (experimental)

To enable parallel testing you can scale the amount of Selenium Chrome nodes with 
`kubectl -n selenium scale --replicas=<AMOUNT> deployment/selenium-node-chrome`
but be careful not to overload your cluster.
Adapt the size or scale your Civo cluster accordingly (2 GB per Selenium node).  
