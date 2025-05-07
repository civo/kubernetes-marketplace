#!/bin/bash

# ------------------------------------------------------------------------------
# filter_apps.sh
#
# This script filters the list of apps based on the existence of conformance.sh
# and changes detected in the app directory. It outputs the filtered list of
# apps in JSON format.
#
# Usage:
#   BASE=<base_branch> bash filter_apps.sh
#
# The 'BASE' environment variable is required and should contain the base branch
# against which to compare changes (e.g., 'main', 'master').
#
# Author: Dinesh Majrekar
# ------------------------------------------------------------------------------
# Change Log:
# 07/05/2025 - First introduction of the filter_apps.sh script

apps=$(jq -c '.[]' apps.json)
filtered_apps=()
for app in $apps; do
  app=$(echo $app | tr -d '"')
  if [ -f "$app/conformance.sh" ] && git diff --name-only $(git merge-base $BASE HEAD)..HEAD -- "$app" | grep -q . ; then
    filtered_apps+=($app)
  fi
done
filtered_apps_json=$(printf '%s\n' "${filtered_apps[@]}" | jq -R . | jq -s .)
echo "filtered-apps=$filtered_apps_json"
