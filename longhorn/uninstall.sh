#!/bin/bash

kubectl -n longhorn-system patch settings.longhorn.io deleting-confirmation-flag --type='merge' -p '{"value":"true"}'
helm uninstall longhorn -n longhorn-system
kubectl delete namespace longhorn-system
