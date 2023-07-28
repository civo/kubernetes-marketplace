#!/bin/sh

helm uninstall --namespace kubewarden kubewarden-defaults
helm uninstall --namespace kubewarden kubewarden-controller
helm uninstall --namespace kubewarden kubewarden-crds

