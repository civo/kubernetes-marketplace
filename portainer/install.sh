#!/bin/sh

# The admin password is stored in a Secret that the deployment reads at start-up
# (--admin-password-file), so Portainer never starts without an admin account.
kubectl apply -f - <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: portainer
---
apiVersion: v1
kind: Secret
metadata:
  name: portainer-admin
  namespace: portainer
type: Opaque
stringData:
  password: "${ADMIN_PASSWORD}"
EOF

case ${EDITION} in
  ce)
    kubectl apply -f https://raw.githubusercontent.com/civo/kubernetes-marketplace/master/portainer/ce-app.yaml
    ;;
  ee)
    kubectl apply -f https://raw.githubusercontent.com/civo/kubernetes-marketplace/master/portainer/ee-app.yaml
    ;;
esac
