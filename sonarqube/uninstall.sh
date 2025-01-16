#!/bin/bash

helm uninstall -n sonarqube sonarqube

kubectl delete namespace sonarqube