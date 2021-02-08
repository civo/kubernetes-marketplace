#!/bin/bash

helm repo add falcosecurity https://falcosecurity.github.io/charts

helm repo update

# Installing falco-exporter with default rules.
helm install falco-exporter -f https://raw.githubusercontent.com/falcosecurity/charts/master/falco-exporter/values.yaml falcosecurity/falco-exporter