#!/bin/bash

# Install Cyclops
helm install cyclops \
  --namespace cyclops \
  --create-namespace \
  --set global.installManager=civo \
  oci://registry-1.docker.io/cyclopsui/cyclops
