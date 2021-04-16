#!/bin/bash

# Delete the app
helm uninstall falco -n falco

# Delete the namespace
kubectl delete namespace falco
