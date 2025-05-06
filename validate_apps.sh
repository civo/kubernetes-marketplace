#!/bin/bash

# Define the list of apps
APPS=($APPS)

# Define the list of skipped dirs
SKIPPED_DIRS=(.git)

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
    echo "The following apps have been added: ${ADDED_APPS[@]}"
    echo "To fix this, remove these apps or update the list of apps in the conformance tests workflow."
  fi
  if [ ${#REMOVED_APPS[@]} -gt 0 ]; then
    echo "The following apps have been removed: ${REMOVED_APPS[@]}"
    echo "To fix this, add these apps back or update the list of apps in the conformance tests workflow."
  fi
  exit 1
fi
