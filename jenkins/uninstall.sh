#!/bin/bash

helm uninstall jenkins --namespace jenkins
kubectl delete ns jenkins