#!/bin/bash

# Enable exit on error and verbose mode: 'set -e' exits immediately if a command
# returns a non-zero status, and 'set -x' prints each command before executing
# it, aiding in debugging.
set -ex

# Install Redis client
apt update && apt install -y redis-tools

# Run conformance test
redis-cli -h localhost SET testkey "Hello, Redis!"
redis-cli -h localhost GET testkey
redis-cli -h localhost EXISTS testkey
