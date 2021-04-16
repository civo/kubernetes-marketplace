#!/bin/bash

# Delete the app
helm uninstall kafka -n kafka

# Delete the namespace
kubectl delete namespace kafka
