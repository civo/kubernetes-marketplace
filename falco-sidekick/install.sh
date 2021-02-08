#!/bin/bash

helm repo add falcosecurity https://falcosecurity.github.io/charts

helm repo update

# Installing falcosidekick with default rules.
helm install falcosidekick -f https://raw.githubusercontent.com/falcosecurity/charts/master/falcosidekick/values.yaml falcosecurity/falcosidekick