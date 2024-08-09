#!/bin/bash

# Install Cyclops
kubectl apply -f https://raw.githubusercontent.com/cyclops-ui/cyclops/v0.8.2/install/cyclops-install.yaml

# Add Cyclops app templates
kubectl apply -f https://raw.githubusercontent.com/cyclops-ui/cyclops/v0.8.2/install/demo-templates.yaml
