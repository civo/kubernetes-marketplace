#!/bin/bash

helm uninstall fission --namespace fission
kubectl delete -k "github.com/fission/fission/crds/v1?ref=v1.15.1"
kubectl delete ns fission