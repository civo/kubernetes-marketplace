#!/bin/bash

# Delete the app
helm uninstall gitlab -n gitlab

# Delete the namespace
kubectl delete namespace gitlab
