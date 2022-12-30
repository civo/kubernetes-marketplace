helm repo add percona https://percona.github.io/percona-helm-charts/
helm repo update
kubectl create ns pmm

helm install pmm percona/pmm --namespace pmm  --set secret.pmm_password=$PMM_ADMIN_PASSWORD --set service.type=$SERVICE_TYPE --set-string pmmEnv.ENABLE_DBAAS="1"
