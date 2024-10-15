#!/bin/bash

helm repo add projectsveltos https://projectsveltos.github.io/helm-charts

helm repo update

helm install projectsveltos projectsveltos/projectsveltos -n projectsveltos --create-namespace --version v0.37.0