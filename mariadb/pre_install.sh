#!/bin/bash

cat <<EOF | kubectl create namespace civo-system
EOF

cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Secret
metadata:
  name: mysql-pass
  namespace: civo-system
type: Opaque
stringData:
  MYSQL_ROOT_PASSWORD: "$MYSQL_ROOT_PASSWORD" # password used mysql root
EOF

cat <<EOF | kubectl get secret mysql-pass --namespace=civo-system -oyaml | grep -v '^\s*namespace:\s' | kubectl apply --namespace=default -f -

EOF   