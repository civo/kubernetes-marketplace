helm repo add percona https://percona.github.io/percona-helm-charts/
helm repo update
kubectl create ns pxc

helm install my-op percona/pxc-operator --namespace pxc

helm install my-db percona/pxc-db  --namespace pxc  --set spec.crVersion="1.11.0" --set secrets.passwords.root=$PERCONA_ROOT_PASSWORD --set pxc.persistence.enabled=true --set pxc.persistence.size=$VOLUME_SIZE
