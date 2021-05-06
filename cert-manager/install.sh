#!/bin/bash

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.2.0/cert-manager.yaml
kubectl delete -A ValidatingWebhookConfiguration cert-manager-webhook
kubectl delete -A mutatingwebhookconfigurations cert-manager-webhook
