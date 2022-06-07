#!/bin/bash

helm uninstall fission --namespace fission
kubectl delete -k "github.com/fission/fission/crds/v1?ref=v1.16.0"
kubectl delete ns fission