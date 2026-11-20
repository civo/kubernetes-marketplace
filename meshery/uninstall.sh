#!/bin/bash

helm uninstall meshery --namespace meshery
kubectl delete ns meshery
