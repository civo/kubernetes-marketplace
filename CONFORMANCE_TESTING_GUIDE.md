# Conformance Testing Guide

## Introduction

Conformance testing is a critical step in ensuring that your application has been successfully installed and is functional in the Kubernetes environment on Civo. This guide provides information on why conformance testing is necessary, what it should cover, and how to implement it.

## Why Conformance Testing?

As part of our [Civo Kubernetes Marketplace](https://github.com/civo/kubernetes-marketplace), we automate the deployment of applications to Kubernetes clusters. Conformance testing verifies that an application has been properly installed and is operating as expected. It checks that all components of the application are running correctly and that the application is accessible and functional.

## What Should Conformance Testing Cover?

Conformance testing for a Civo Kubernetes Marketplace application should cover the following:

* Verification that the application has been installed correctly according to its `app.yaml` or `install.sh` script
* Verification that all components of the application are running
* Verification that the application is accessible and functional

## Implementing Conformance Testing

The conformance test is automated through the `.github/workflows/conformance-tests.yaml` GitHub Actions workflow. This workflow creates a Civo Kubernetes cluster for each app, runs the conformance test if there are changes in the app directory, and then deletes the cluster.

The conformance test script will need to connect to the application and install any tools the app requires.

Note that you do not need to install the conformance test as part of your script. Civo will take care of that.

## Example: Redis Conformance Test

The following is an example of a conformance test for the redis application:

```console
#!/bin/bash

# Wait for Redis pod to be ready
kubectl wait --for=condition=ready pod -l app=redis --timeout=300s

# Install Redis client
apt update && apt install -y redis-tools

# Port-forward to Redis service
kubectl port-forward svc/redis 6379:6379 &
sleep 5  # Allow some time for port-forwarding to establish

# Wait for Redis to be ready with a timeout
timeout=60
elapsed=0
while ! redis-cli -h localhost ping; do
  sleep 1
  elapsed=$((elapsed + 1))
  if [ $elapsed -ge $timeout ]; then
    echo "Timeout waiting for Redis to be ready"
    exit 1
  fi
done

# Run conformance test
if [ $(redis-cli -h localhost EXISTS testkey) -ne 0 ]; then
  echo "Conformance test failed: Key testkey already exists before SET"
  exit 1
fi
redis-cli -h localhost SET testkey "Hello, Redis!"
if [ $(redis-cli -h localhost EXISTS testkey) -ne 1 ]; then
  echo "Conformance test failed: Key testkey does not exist after SET"
  exit 1
fi
GET_OUTPUT=$(redis-cli -h localhost GET testkey)
if [ "$GET_OUTPUT" != "\"Hello, Redis!\"" ]; then
  echo "Conformance test failed: Expected 'Hello, Redis!' but got $GET_OUTPUT"
  exit 1
fi
```
This example demonstrates how to validate the redis application by waiting for the pod to be ready, installing required tools, accessing the application, and testing its functionality.
