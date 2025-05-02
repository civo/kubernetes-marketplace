#!/bin/bash

# Install Redis client
apt update && apt install -y redis-tools

# Run conformance test
redis-cli -h redis -a $REDIS_PASS SET testkey "Hello, Redis!"
redis-cli -h redis -a $REDIS_PASS GET testkey
redis-cli -h redis -a $REDIS_PASS EXISTS testkey
