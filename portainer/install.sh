#!/bin/sh

case ${EDITION} in
  ce)
    kubectl apply -f https://raw.githubusercontent.com/civo/kubernetes-marketplace/master/portainer/ce-app.yaml
    ;;
  ee)  
    kubectl apply -f https://raw.githubusercontent.com/civo/kubernetes-marketplace/master/portainer/ee-app.yaml
    ;;
esac

