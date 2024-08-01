# Getting started

After installing EDP from the Civo Marketplace, you need to get the `EDP Portal URL` and `admin credentials` to log in to the portal.

1. Get Portal Url from Ingress, run command:

```bash
kubectl get ingress portal -n edp -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
```

The output will be the URL to access the EDP Portal, for example:

https://portal-edp.xxxxx-xxxxx-xxxxx-xxxxx-xxxxx.k8s.civo.com/

where `xxxxx-xxxxx-xxxxx-xxxxx-xxxxx` is your cluster id.

2. Generate Service Account Token to access the portal using Kubernetes:

```bash
  kubectl -n edp create serviceaccount edp-admin
  kubectl create clusterrolebinding edp-admin --serviceaccount=edp:edp-admin --clusterrole=cluster-admin
  kubectl create token edp-admin -n edp
```

For more details please refer to [EDP documentation](https://epam.github.io/edp-install/quick-start/platform-installation/).

## Argo CD Integration

For Argo CD integration please consult [Official Documentation](https://epam.github.io/edp-install/quick-start/integrate-argocd/)

## Tekton Dashboard

As a part of EDP, Tekton Dashboard is installed and is **available for external access**. You have to [enable SSO](https://epam.github.io/edp-install/operator-guide/oauth2-proxy/), or disable external access.
