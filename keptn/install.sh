#!/bin/bash

curl -sL https://get.keptn.sh | sudo -E bash

echo "{}" > creds.json

keptn install --endpoint-service-type=ClusterIP --use-case=continuous-delivery -c ./creds.json

kubectl get deployments -n keptn






