# Gitpod

Thank you for deploying [Gitpod](https://github.com/gitpod-io/gitpod) to Civo's Kubernetes service.

## Next steps

You need to create a secret so that cert-manager can create certificates. You will need your API
token from your [Civo settings page](https://www.civo.com/account/security).

```shell
kubectl create secret generic civo-dns --namespace=cert-manager --from-literal=key=<YOUR_CIVO_API_KEY>
```

## Accessing your cluster

This is running at [gitpod.$CLUSTER_ID.k8s.civo.com](https://gitpod.$CLUSTER_ID.k8s.civo.com)
