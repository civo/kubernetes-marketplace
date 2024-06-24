## Argo CD

### Access Argo CD UI

In order to access the server UI you have the following options:

1. kubectl port-forward service/argo-cd-argocd-server -n argocd 8080:443

   and then open the browser on http://localhost:8080 and accept the certificate

2. enable ingress in the values file `server.ingress.enabled` and either
    - Add the annotation for ssl passthrough: https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/ingress.md#option-1-ssl-passthrough
    - Add the `--insecure` flag to `server.extraArgs` in the values file and terminate SSL at your ingress: https://github.com/argoproj/argo-cd/blob/master/docs/operator-manual/ingress.md#option-2-multiple-ingress-objects-and-hosts


After reaching the UI the first time you can login with username: admin and the random password generated during the installation. You can find the password by running:

```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

(You should delete the initial secret afterwards as suggested by the Getting Started Guide: https://github.com/argoproj/argo-cd/blob/master/docs/getting_started.md#4-login-using-the-cli)

### Usage instruction

See the [Argo CD documentations](https://argoproj.github.io/argo-cd/)

### Further reading 

* A [Collection of Argo CD and Civo tutorials](https://www.civo.com/learn/categories/argo-cd)
* Example of Civo and Argo CD use cases:
   * [Using Argo CD in Kubernetes to deploy applications with GitOps](https://www.civo.com/learn/install-argo-cd-in-k3s-civo-cloud-for-deploy-applications)
   * [Progressive Delivery of Applications on Kubernetes with Argo Rollouts and Argo CD](https://www.civo.com/learn/progressive-delivery-of-applications)
   * [Deploying serverless workload on Kubernetes using Knative and ArgoCD](https://www.civo.com/learn/deploying-knative-serverless-argocd)
   * [Installing an Apache Kafka cluster on Kubernetes using Strimzi and GitOps](https://www.civo.com/learn/installing-an-apache-kafka-cluster-on-kubernetes-using-strimzi-and-gitops)
