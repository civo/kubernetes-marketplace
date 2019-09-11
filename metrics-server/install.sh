#!/bin/bash

helm repo update

# Work-around from OpenFaaS docs - https://docs.openfaas.com/tutorials/kubernetes-hpa/
helm install --name metrics-server --namespace kube-system \
  stable/metrics-server \
  --set args="{--kubelet-insecure-tls,--kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname}"
