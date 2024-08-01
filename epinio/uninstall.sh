#!/bin/sh 

helm uninstall --namespace epinio epinio

kubectl delete namespace epinio
