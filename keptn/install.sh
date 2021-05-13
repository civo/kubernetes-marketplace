#!/bin/bash

helm upgrade keptn keptn --install -n keptn --create-namespace --wait --version=0.8.2 --repo=https://storage.googleapis.com/keptn-installer --set=control-plane.apiGatewayNginx.type=LoadBalancer