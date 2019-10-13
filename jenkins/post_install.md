## Jenkins

### External access

By default external access to the Jenkins UI port isn't available. This is easily changed by applying the following YAML to your cluster with `kubectl apply -f jenkins-service.yaml` (or whatever you call the file containing the contents below):

```
apiVersion: v1
kind: Service
metadata:
  name: jenkins-service
spec:
  type: LoadBalancer
  ports:
    - port: 8080
      targetPort: 8080
      protocol: TCP
  selector:
    app: jenkins
```

This will open up http://YOUR_CLUSTER_ID.k8s.civo.com:8080 to the whole world. You should lock this down in the [firewall](https://www.civo.com/account/firewalls) automatically created in Civo for your Kubernetes cluster. Locking down the firewall will only affect access from OUTSIDE of your Kubernetes cluster, access from your applications within Kubernetes will not be affected.

### Usage instruction

You can use this application from within your cluster by just using the hostname `jenkins`, so jenkins agents can use the hostname `jenkins` and the port `50000`. The username and password for jenkins is set via environment variables, `JENKINS_USERNAME` and `JENKINS_PASSWORD` using `CIVO:ALPHANUMERIC(x)` value and is presented in the Web UI and CLI.
