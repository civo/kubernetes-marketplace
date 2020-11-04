#!/bin/bash

cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Secret
metadata:
  name: mysql-pass
type: Opaque
stringData:
  MYSQL_ROOT_PASSWORD: "$MYSQL_ROOT_PASSWORD" # password used mysql root
EOF