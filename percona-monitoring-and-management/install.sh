#!/bin/bash
export PMM_PASSWORD=$(echo ${PMM_ADMIN_PASSWORD}|base64)

# Creating secret
envsubst < secret.yml|kubectl apply -f -

# Add the Percona Helm repository
helm repo add percona https://percona.github.io/percona-helm-charts/

# Update your local Helm chart repository cache
helm repo update

# Install the PMM  Helm chart
helm install pmm percona/pmm --set secret.create=false --set service.type=$SERVICE_TYPE

# Wait for pod to be ready
kubectl wait pods --for condition=Ready --timeout=5m pmm-0

# Getting public address for the next step
public_address=$(kubectl get svc monitoring-service -o jsonpath="{.status.loadBalancer.ingress[0].ip"})

# Setting PMM settings to enable DBaaS correctly. It requires public address to be set
settings_data="{\"enable_dbaas\": true, \"pmm_public_address\": \"$public_address\"}"

curl -k -XPOST -u "admin:$admin_password" https://$public_address/v1/Settings/Change\
	-H 'Content-type: application/json'\
	-H 'Accept: application/json'\
	--data-raw "$settings_data"
