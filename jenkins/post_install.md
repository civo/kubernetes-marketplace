## Jenkins

### External access

By default external access to the Jenkins UI port isn't available. This is easily changed by applying the following YAML to apply ingress via traefik to your cluster with `kubectl apply -f jenkins-ingress.yaml` (or whatever you call the file containing the contents below):

```yaml
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: jenkins-ingress
spec:
  rules:
  - host: jenkins.your-cluster-id.k8s.civo.com
    http:
      paths:
      - backend:
          serviceName: jenkins-frontend
          servicePort: 8080
```

This will open up http://jenkins.DOMAIN_NAME to the whole world. You should lock this down in the [firewall](https://www.civo.com/account/firewalls) automatically created in Civo for your Kubernetes cluster. Locking down the firewall will only affect access from OUTSIDE of your Kubernetes cluster, access from your applications within Kubernetes will not be affected.

### Usage instruction

You can use this application from within your cluster by just using the hostname `jenkins`, so jenkins agents can use the hostname `jenkins` and the port `50000`. The username and password for jenkins is set via environment variables, `JENKINS_USERNAME` and `JENKINS_PASSWORD` using the username and password presented in the Web UI and CLI.
