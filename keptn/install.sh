#!/bin/bash

curl -sL https://get.keptn.sh | sudo -E bash

keptn install --endpoint-service-type=ClusterIP --use-case=continuous-delivery

kubectl get deployments -n keptn






