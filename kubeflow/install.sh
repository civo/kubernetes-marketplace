#!/bin/bash

while ! kubectl apply -f https://raw.githubusercontent.com/civo/kubernetes-marketplace/master/kubeflow/kubeflow.yaml; do echo "Retrying to apply resources"; sleep 10; done