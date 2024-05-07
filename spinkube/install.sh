#!/bin/sh
#Check we are on Talos
if $(kubectl get nodes -o json | jq .items.[].status.nodeInfo.osImage | grep -q "Talos"); then 
    echo "Found Talos as part of OS Image string"; else
    echo "Did not find Talos as part of the OS Image string. Exiting as only Talos is supported" ;
    exit
fi

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

kubectl apply -f https://github.com/spinkube/spin-operator/releases/download/v0.1.0/spin-operator.runtime-class.yaml
kubectl apply -f https://github.com/spinkube/spin-operator/releases/download/v0.1.0/spin-operator.crds.yaml
kubectl apply -f https://github.com/spinkube/spin-operator/releases/download/v0.1.0/spin-operator.shim-executor.yaml
helm install spin-operator \
  --namespace spin-operator \
  --create-namespace \
  --version 0.1.0 \
  --wait \
  oci://ghcr.io/spinkube/charts/spin-operator
