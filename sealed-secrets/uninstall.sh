#!/bin/bash

helm uninstall sealed-secrets --namespace sealed-secrets
kubectl delete ns sealed-secrets