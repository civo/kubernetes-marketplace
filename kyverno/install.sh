#!/bin/bash

helm repo add kyverno https://kyverno.github.io/kyverno/

helm repo update

helm install kyverno kyverno/kyverno --namespace kyverno --create-namespace --version 2.5.1

helm install kyverno-policies kyverno/kyverno-policies --namespace kyverno --version 2.5.1
