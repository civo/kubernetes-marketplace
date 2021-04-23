helm uninstall civo -n=okteto
kubectl delete secret default-ssl-certificate civo-cert-registry civo-cert-ingress -n=okteto
kubectl delete ns okteto