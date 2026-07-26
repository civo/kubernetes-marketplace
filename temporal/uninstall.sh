#!/bin/bash

# Uninstall the Temporal Helm release
helm uninstall temporal -n temporal

# Delete the namespace
kubectl delete namespace temporal
