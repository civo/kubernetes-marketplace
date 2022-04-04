#!/bin/bash

helm uninstall argo-cd --namespace argocd
kubectl delete ns argocd
