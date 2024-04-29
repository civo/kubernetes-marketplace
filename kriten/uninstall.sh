#!/bin/bash

helm uninstall kriten -n kriten
kubectl delete namespace kriten
