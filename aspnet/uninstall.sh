#!/bin/bash

# Delete the app
helm uninstall core -n core

# Delete the namespace
kubectl delete namespace core
