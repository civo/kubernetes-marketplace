#!/bin/bash

helm uninstall external-secrets --namespace external-secrets
kubectl delete ns external-secrets