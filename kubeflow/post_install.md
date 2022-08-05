## Verify Kubeflow deployment

After installation, it will take some time for all Pods to become ready. You should make sure all Pods are ready, to check that all Kubeflow-related Pods are ready, run the following commands:

```sh
kubectl get pods -n cert-manager
kubectl get pods -n istio-system
kubectl get pods -n auth
kubectl get pods -n knative-eventing
kubectl get pods -n knative-serving
kubectl get pods -n kubeflow
kubectl get pods -n kubeflow-user-example-com
```

## Connect to your Kubeflow Cluster

You can connect to your Kubeflow cluster by getting the external IP for `istio-ingressgateway` service:

```sh
kubectl get svc -n istio-system  istio-ingressgateway
```

You would be able to access the Kubeflow dashboard by finding the DNS Name under the "Load Balancers" section of your Civo dashboard too.

The default username to login to the Kubeflow dashboard is `user@example.com` and the default password is `12341234`.