#!/bin/bash

# ------------------------------------------------------------------------------
# validate_apps.sh
#
# This script validates the list of apps in the current directory against the
# list of apps defined in the conformance tests workflow. It checks for any
# added or removed apps and outputs an error message if there are any
# discrepancies.
#
# Usage:
#   APPS="app1 app2 app3" ./validate_apps.sh
#
# The 'APPS' environment variable is required and should contain a space-separated
# list of app names. The list should be quoted to ensure it's treated as a single value.
#
# Author: Dinesh Majrekar
# ------------------------------------------------------------------------------
# Change Log:
# 06/05/2025 - First introduction of the validate_apps.sh script
# 08/05/2025 - Added 'doc' to the list of skipped directories


# Define the list of apps from apps.json if it exists
if [ -f "apps.json" ]; then
  APPS=($(jq -r '.[]' apps.json))
else
  echo "Error: apps.json file not found"
  exit 1
fi

# Define the list of skipped dirs
SKIPPED_DIRS=(.git bin doc)

# Get the list of dirs in the current directory
DIRS=()
for dir in */; do
  DIRS+=("${dir%/}")
done

# Check if any apps have been added or removed
ADDED_APPS=()
REMOVED_APPS=()
for dir in "${DIRS[@]}"; do
  if [[ ! " ${APPS[@]} " =~ " ${dir} " ]] && [[ ! " ${SKIPPED_DIRS[@]} " =~ " ${dir} " ]]; then
    ADDED_APPS+=("${dir}")
  fi
done
for app in "${APPS[@]}"; do
  if [[ ! " ${DIRS[@]} " =~ " ${app} " ]]; then
    REMOVED_APPS+=("${app}")
  fi
done

# Output an error message if any apps have been added or removed
if [ ${#ADDED_APPS[@]} -gt 0 ] || [ ${#REMOVED_APPS[@]} -gt 0 ]; then
  echo "Error: The list of apps is not current."
  if [ ${#ADDED_APPS[@]} -gt 0 ]; then
    echo "The following directories have been added: ${ADDED_APPS[@]}"
    echo
    echo "To fix this, remove these directories or update the list of apps in the conformance tests workflow."
  fi
  if [ ${#REMOVED_APPS[@]} -gt 0 ]; then
    echo "The following apps have been removed: ${REMOVED_APPS[@]}"
    echo
    echo "To fix this, add these apps back or update the list of apps in the conformance tests workflow."
  fi
  exit 1
else
  echo "The list of apps is current."
  exit 0
fi
