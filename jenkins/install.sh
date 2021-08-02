#!/bin/bash

helm repo add jenkins https://charts.jenkins.io
helm repo update

kubectl create namespace jenkins

helm install jenkins jenkins/jenkins --version 3.5.9 --namespace jenkins --set persistence.size=$VOLUME_SIZE \
--set controller.adminUser=$JENKINS_USERNAME \
--set controller.adminPassword=$JENKINS_PASSWORD
