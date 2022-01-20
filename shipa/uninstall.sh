#!/bin/bash

#Remove Shipa
helm uninstall shipa

#Clean Up Namespace
kubectl delete namespaces shipa-system