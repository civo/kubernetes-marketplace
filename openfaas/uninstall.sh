#!/bin/bash

kubectl delete -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml
helm --namespace openfaas delete openfaas
kubectl delete namespace openfaas

