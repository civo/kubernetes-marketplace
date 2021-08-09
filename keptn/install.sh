#!/bin/bash

# download the Keptn helm chart
curl -o keptn.tgz https://storage.googleapis.com/keptn-installer/keptn-0.8.7.tgz 

# install the downloaded keptn helm chart
helm upgrade keptn keptn.tgz --install -n keptn --create-namespace --wait --version=0.8.7 --set=control-plane.apiGatewayNginx.type=LoadBalancer --timeout 10m
