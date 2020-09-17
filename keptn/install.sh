#!/bin/bash

curl -sL https://get.keptn.sh | sudo -E bash

keptn install --endpoint-service-type=ClusterIP --use-case=continuous-delivery

kubectl get deployments -n keptn

kubectl -n keptn port-forward service/api-gateway-nginx 8080:80

KEPTN_ENDPOINT=http://localhost:8080/api
KEPTN_API_TOKEN=$(kubectl get secret keptn-api-token -n keptn -ojsonpath='{.data.keptn-api-token}' | base64 --decode)

keptn auth --endpoint=$KEPTN_ENDPOINT --api-token=$KEPTN_API_TOKEN

keptn configure bridge --output





