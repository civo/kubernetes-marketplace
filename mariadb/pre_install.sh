#!/bin/bash

kubectl create ns mariadb

kubectl apply -f - <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: mysql-pass
  namespace: mariadb
type: Opaque
stringData:
  MYSQL_ROOT_PASSWORD: "$MYSQL_ROOT_PASSWORD" # password used mysql root
EOF
