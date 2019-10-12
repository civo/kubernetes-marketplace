## Jenkins

### External access

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

### Usage instruction

You can use this application from within your cluster by just using the hostname `jenkins`, so jenkins agents can use the hostname `jenkins` and the port `5000`. 

After jenkins has been deployed and you have exposed external access, you can access jenkins on the mentioned url and port, and then jenkins will request the initial password:

<img width="998" alt="5CE566FA-2B7F-42B5-B19F-63D19A4C4BC0" src="https://user-images.githubusercontent.com/567298/66704075-358e6300-ed19-11e9-8973-29c45ce67f20.png">

Get the jenkins pod name:

```
$ kubectl get pods --selector app=jenkins
```

Then exec into the container and retrieve the initial password:

```
$ kubectl exec -it jenkins-xxxxxxxxx-xxxxx -- cat /var/jenkins_home/secrets/initialAdminPassword
423d1248daee49b8949a73abe52b3a43
```

After you provide the password, select continue and then if you want to stick with the defaults, "Install the suggested plugins":

<img width="998" alt="F911FD13-862D-4313-9EA0-02598DA92315" src="https://user-images.githubusercontent.com/567298/66704109-8ef69200-ed19-11e9-8dd5-706919cb2e84.png">

In the user creation wizard, if you want to create a new user you will be faced with a "No valid crumb was included in the request" when using this in Kubernetes. This has been raised in issue [JENKINS-42200](https://issues.jenkins-ci.org/browse/JENKINS-42200), and the workaround is to continue as admin, and configured "Enable proxy compatibility" in the security settings of jenkins.

After you logged in as admin, select "Manage Jenkins", "Configure Global Security" and enable proxy compatibility under "CSRF Protection":

<img width="518" alt="75431463-2FC5-47AF-BE21-66BD4390534A" src="https://user-images.githubusercontent.com/567298/66704300-cc0f5400-ed1a-11e9-859c-b418636e6c15.png">

