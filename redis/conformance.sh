#!/bin/bash

# Install Redis client
apt update && apt install -y redis-tools

# Run conformance test
redis-cli -h redis SET testkey "Hello, Redis!"
redis-cli -h redis GET testkey
redis-cli -h redis EXISTS testkey
