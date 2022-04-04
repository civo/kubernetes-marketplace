#!/bin/bash

helm uninstall longhorn -n longhorn-system
kubectl delete namespace longhorn-system
