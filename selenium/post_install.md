## Selenium

This is a ready Selenium hub with Chrome node

### Usage instruction

Go to `http://selenium.${CLUSTER_ID}.k8s.civo.com` to access console

Add `http://selenium.${CLUSTER_ID}.k8s.civo.com` as your webdriver remote url for your test scripts. 

### Updating browser version

Just redeploy the Selenium node(s) with `kubectl -n selenium rollout restart deployment/selenium-node-chrome`

### Scaling (experimental)

To enable parallel testing you can scale the amount of Selenium Chrome nodes with 
`kubectl -n selenium scale --replicas=<AMOUNT> deployment/selenium-node-chrome`
but be careful not to overload your cluster.
Adapt the size or scale your Civo cluster accordingly (2 GB per Selenium node).  
