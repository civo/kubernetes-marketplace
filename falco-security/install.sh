#!/bin/bash

helm repo add falcosecurity https://falcosecurity.github.io/charts

helm repo update

# Installing falco with default rules.
helm install falco -f https://raw.githubusercontent.com/falcosecurity/charts/master/falco/values.yaml falcosecurity/falco