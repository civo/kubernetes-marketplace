#!/bin/bash

# create namespace
kubectl create ns joomla

# copy DB secret from mariadb namespace
kubectl get secret mysql-pass -n mariadb -o yaml | kubectl apply -n joomla -f -
