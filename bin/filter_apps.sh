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
# 07/05/2025 - Fix for GitHub Actions environment
# 07/05/2025 - Updated to produce compact JSON output

# Make sure we have a valid base reference
if ! git rev-parse --verify "origin/$BASE" >/dev/null 2>&1; then
  echo "Error: Branch origin/$BASE does not exist. Available branches:"
  git branch -a
  echo "filtered-apps=[]"
  exit 0
fi

apps=$(jq -c '.[]' apps.json)
filtered_apps=()

for app in $apps; do
  app=$(echo $app | tr -d '"')
  if [ -f "$app/conformance.sh" ] && git diff --name-only "origin/$BASE"..HEAD -- "$app" | grep -q . ; then
    filtered_apps+=($app)
  fi
done

if [ ${#filtered_apps[@]} -eq 0 ]; then
  echo "filtered-apps=[]"
else
  # Use jq with -c flag to create compact JSON without line breaks
  filtered_apps_json=$(printf '%s\n' "${filtered_apps[@]}" | jq -R . | jq -s -c .)
  echo "filtered-apps=$filtered_apps_json"
fi

