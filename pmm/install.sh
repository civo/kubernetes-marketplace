#!/bin/bash
admin_password=$(date|md5|base64|head -c 16;echo)

# Add the Percona Helm repository
helm repo add percona https://percona.github.io/percona-helm-charts/

# Update your local Helm chart repository cache
helm repo update

# Install the PMM  Helm chart
helm install pmm --set secret.pmm_password=$admin_password --set service.type=LoadBalancer percona/pmm

# Wait for pod to be ready
kubectl wait pods -n default --for condition=Ready --timeout=120s pmm-0

# Getting public address for the next step
public_address=$(kubectl get service monitoring-service -o json|jq -r '.status.loadBalancer.ingress[0].ip')

# Setting PMM settings to enable DBaaS correctly. It requires public address to be set
admin_password="NjMxY2FiZmJkNzUx"
settings_data="{\"enable_dbaas\": true, \"pmm_public_address\": \"$public_address\"}"

curl -k -XPOST -u "admin:$admin_password" https://$public_address/v1/Settings/Change\
	-H 'Content-type: application/json'\
	-H 'Accept: application/json'\
	--data-raw "$settings_data"
