#!/bin/bash

helm uninstall reloader --namespace reloader
kubectl delete ns reloader