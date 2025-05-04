#!/bin/bash

# Enable exit on error and verbose mode: 'set -e' exits immediately if a command
# returns a non-zero status, and 'set -x' prints each command before executing
# it, aiding in debugging.
set -ex

# Install Redis client
apt update && apt install -y redis-tools

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
