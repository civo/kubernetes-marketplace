#!/bin/bash

helm uninstall rekor --namespace rekor
kubectl delete ns rekor