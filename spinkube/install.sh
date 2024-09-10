#!/bin/sh

SPINKUBE_VERSION="0.2.0"

#Check we are on Talos
max_time_seconds=300
elapsed_time_seconds=0
until $(kubectl get nodes -o json | jq -r '.items[] | .status.nodeInfo.osImage' | grep -q 'Talos'); do
  if [ "$elapsed_time_seconds" -ge "$max_time_seconds" ]; then
    echo "Timeout reached when checking OS image. Did not find Talos as part of the OS Image string. Exiting as only Talos is supported."
    exit
  fi
  echo "Waiting for OS image to return \"Talos\""
  sleep 1
  ((elapsed_time_seconds++))
done
echo "Found Talos as part of OS Image string"

#Cert manager check
#If namespace, or deployment is not found, the wait command below will fail, and the script continues.
until $(kubectl get namespaces cert-manager -o name --ignore-not-found | grep -q "namespace/cert-manager"); do
    echo "Waiting for cert-manager namespace creation";
    sleep 1;
done

until $(kubectl get deployment cert-manager-webhook -n cert-manager --ignore-not-found -o name | grep -q "deployment.apps/cert-manager-webhook"); do
    echo "Waiting for cert-manager-webhook deployment";
    sleep 1;
done

kubectl wait --for=condition=available --timeout=300s deployment/cert-manager-webhook  -n cert-manager

kubectl apply -f https://github.com/spinkube/spin-operator/releases/download/v$SPINKUBE_VERSION/spin-operator.runtime-class.yaml
kubectl apply -f https://github.com/spinkube/spin-operator/releases/download/v$SPINKUBE_VERSION/spin-operator.crds.yaml
kubectl apply -f https://github.com/spinkube/spin-operator/releases/download/v$SPINKUBE_VERSION/spin-operator.shim-executor.yaml
helm install spin-operator \
  --namespace spin-operator \
  --create-namespace \
  --version $SPINKUBE_VERSION \
  --wait \
  oci://ghcr.io/spinkube/charts/spin-operator
