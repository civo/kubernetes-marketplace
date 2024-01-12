# Getting started

After installing EDP from the Civo Marketplace, you need to get the `EDP Portal URL` and `admin credentials` to log in to the portal.

1. Get Portal Url from Ingress run:

```bash
kubectl get ingress edp-headlamp -n edp -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
```

For example you will get:

https://edp-headlamp-edp.xxxxx-xxxxx-xxxxx-xxxxx-xxxxx.k8s.civo.com/

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
