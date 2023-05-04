#!/bin/bash

# Add the Helm repository for kubeclarity
helm repo add kubeclarity https://openclarity.github.io/kubeclarity
helm repo update

# Install kubeclarity
helm install --create-namespace kubeclarity kubeclarity/kubeclarity -n kubeclarity
