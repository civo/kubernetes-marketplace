# Manual testing

## Prepare tiller

For manual testing Tiller

* [Download here](https://github.com/openfaas/faas-netes/blob/master/HELM.md)

* Then run this:

```sh
kubectl -n kube-system create sa tiller \
  && kubectl create clusterrolebinding tiller \
  --clusterrole cluster-admin \
  --serviceaccount=kube-system:tiller
```

* Install tiller

```
helm init --skip-refresh --upgrade --service-account tiller
```

## Install OpenFaaS

Run:

```sh
export GATEWAY_PASSWORD=$(head -c 12 /dev/urandom | shasum| cut -d' ' -f1)
install.sh
```

## Test the installation

See [post_install.md](post_install.md)
