#!/bin/bash
kubectl create namespace falco

helm repo add falcosecurity https://falcosecurity.github.io/charts

helm repo update

# Installing falco with default rules.
helm install falco -f https://raw.githubusercontent.com/falcosecurity/charts/master/falco/values.yaml -n falco falcosecurity/falco --set falcosidekick.enabled=true --set falcosidekick.webui.enabled=true