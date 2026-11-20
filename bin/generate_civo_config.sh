#!/bin/bash

# generate_civo_config.sh
#
# This script generates random values for CIVO configurations specified in a manifest.yaml file.
# It is used in the conformance testing workflow to dynamically generate required configuration values.
# Currently, it supports generating random alphanumeric strings for configurations specified with CIVO:ALPHANUMERIC(num).
#
# Usage:
#   bash generate_civo_config.sh <path_to_manifest.yaml>
#
# Example:
#   bash generate_civo_config.sh manifest.yaml

# Set locale to C to avoid issues with tr command
export LC_ALL=C

# Read manifest.yaml and generate random values for CIVO config
var_name="REDIS_PASS"
var_value=$(yq e ".configuration.$var_name.value" $1)
if [[ $var_value =~ CIVO:ALPHANUMERIC\(([0-9]+)\) ]]; then
  var_length=${BASH_REMATCH[1]}
  random_value=$(tr -dc 'a-zA-Z0-9' < /dev/urandom | fold -w $var_length | head -n 1)
  echo "$var_name=$random_value"
  export "$var_name=$random_value"
fi
