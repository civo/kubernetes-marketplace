#!/bin/bash

# Add the Helm repository for kubeclarity
helm repo add kubeclarity https://cisco-open.github.io/kubei
helm repo update

# Install kubeclarity
helm install --create-namespace kubeclarity kubeclarity/kubeclarity -n kubeclarity
