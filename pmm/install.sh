#!/bin/bash

# Add the Percona Helm repository
helm repo add percona https://percona.github.io/percona-helm-charts/

# Update your local Helm chart repository cache
helm repo update

# Install the PMM  Helm chart
helm install pmm percona/pmm --set secret.pmm_password="$PMM_ADMIN_PASSWORD" --set service.type=LoadBalancer --set-string pmmEnv.ENABLE_CLUSTER_ROLE_ADMIN="1"

# Wait for pod to be ready
kubectl wait pods --for condition=Ready --timeout=5m pmm-0

# Getting public address for the next step
while true
do
	ip=$(kubectl get svc monitoring-service -o jsonpath="{.status.loadBalancer.ingress[0].ip}")
	if [ "$ip" != "" ]
	then
		break
	fi
done
public_address=$(kubectl get svc monitoring-service -o jsonpath="{.status.loadBalancer.ingress[0].ip}")

# Setting PMM settings to enable DBaaS correctly. It requires public address to be set
settings_data="{\"enable_dbaas\": true, \"pmm_public_address\": \"$public_address\"}"

curl -k -XPOST -u 'admin:'"$PMM_ADMIN_PASSWORD"'' https://"$public_address"/v1/Settings/Change\
	-H 'Content-type: application/json'\
	-H 'Accept: application/json'\
	--data-raw "$settings_data"
