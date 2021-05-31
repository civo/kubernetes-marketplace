#!/bin/bash

helm uninstall keda --namespace keda
kubectl delete ns keda