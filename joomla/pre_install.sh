#!/bin/bash

# Create namespace
kubectl create ns joomla

# Copy DB secret from mariadb namespace.
# Note: the middle "grep" is to remove source "mariadb" namespace from the YAML.
kubectl get secret mysql-pass -n mariadb -o yaml | grep -v '^\s*namespace:\s' | kubectl apply -n joomla -f -
