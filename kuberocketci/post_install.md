# Getting started

After installing KubeRocketCI from the Civo Marketplace, you need to get the `KubeRocketCI Portal URL` and `admin credentials` to log in to the portal.

1. Get Portal Url from Ingress, run command:

```bash
kubectl get ingress portal -n edp -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
```

The output will be the URL to access the KubeRocketCI Portal, for example:

https://portal-edp.xxxxx-xxxxx-xxxxx-xxxxx-xxxxx.k8s.civo.com/

where `xxxxx-xxxxx-xxxxx-xxxxx-xxxxx` is your cluster id.

2. Generate Service Account Token to access the portal using Kubernetes:

```bash
  kubectl -n edp create serviceaccount edp-admin
  kubectl create clusterrolebinding edp-admin --serviceaccount=edp:edp-admin --clusterrole=cluster-admin
  kubectl create token edp-admin -n edp
```

For more details please refer to [KubeRocketCI documentation](https://docs.kuberocketci.io./docs/quick-start/quick-start-overview).

## Argo CD Integration

For Argo CD integration please consult [Official Documentation](https://docs.kuberocketci.io./docs/quick-start/integrate-argocd)

## Tekton Dashboard

As a part of KubeRocketCI, Tekton Dashboard is installed and is **available for external access**. You have to [enable SSO](https://docs.kuberocketci.io./docs/operator-guide/auth/oauth2-proxy), or disable external access.
