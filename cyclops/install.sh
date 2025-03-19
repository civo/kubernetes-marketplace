#!/bin/bash

# Install Cyclops
helm install cyclops \
  --version 0.14.4 \
  --namespace cyclops \
  --create-namespace \
  --set global.installManager=civo \
  oci://registry-1.docker.io/cyclopsui/cyclops
