# Redis Testing Guide

## Introduction

This guide provides step-by-step instructions on how to test the Redis application in the Kubernetes environment.

## Prerequisites

* CIVO_API_KEY environment variable set
* Kubernetes cluster created using Civo CLI
* Redis installed and running in the Kubernetes cluster

## Conformance Test Steps

1. Install Redis client: `apt update && apt install -y redis-tools`
2. Set a test key: `redis-cli -h redis -a $REDIS_PASS SET testkey "Hello, Redis!"`
3. Get the test key: `redis-cli -h redis -a $REDIS_PASS GET testkey`
4. Check if the test key exists: `redis-cli -h redis -a $REDIS_PASS EXISTS testkey`

## Environment Variables

* `CIVO_API_KEY`: Civo API key for creating and managing Kubernetes clusters
* `REDIS_PASS`: Redis password retrieved from Kubernetes secret
* `KUBECONFIG`: Path to the Kubernetes configuration file

## Additional Information

The conformance test is automated through the `.github/workflows/redis-deploy-test.yaml` GitHub Actions workflow. This workflow creates a Civo Kubernetes cluster, installs Redis, runs the conformance test, and then deletes the cluster.

To run the conformance test manually, follow the steps outlined in the `redis/conformance.sh` script.
