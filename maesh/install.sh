#!/bin/bash

helm repo add traefik-mesh https://helm.traefik.io/mesh
helm repo update
helm install traefik-mesh traefik-mesh/traefik-mesh --set controller.image.pullPolicy=IfNotPresent --set controller.image.tag=v1.4.5 --namespace mesh --create-namespace 

