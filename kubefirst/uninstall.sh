#!/bin/bash

helm uninstall kubefirst --namespace kubefirst

kubectl delete namespace kubefirst
