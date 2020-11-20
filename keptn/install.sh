#!/bin/bash

## Getting Istio as a prerequisite for continuous delivery installation of Keptn
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.6.5 sh -

./istio-1.6.5/bin/istioctl install -y

## Installing Keptn

curl -sL https://get.keptn.sh | sudo -E bash

echo "{}" > creds.json

keptn install --endpoint-service-type=ClusterIP --use-case=continuous-delivery -c creds.json

## Configuring Keptn + Istio

echo "Configure Istio and Keptn"
# Applying ingress-manifest
kubectl apply -f - <<EOF
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  annotations:
    kubernetes.io/ingress.class: istio
  name: api-keptn-ingress
  namespace: keptn
spec:
  rules:
  - host: $CIVO_CLUSTER_ID.k8s.civo.com
    http:
      paths:
      - backend:
          serviceName: api-gateway-nginx
          servicePort: 80
EOF

# Applying public gateway
kubectl apply -f - <<EOF
---
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: public-gateway
  namespace: istio-system
spec:
  selector:
    istio: ingressgateway
  servers:
  - port:
      name: http
      number: 80
      protocol: HTTP
    hosts:
    - '*'
EOF

echo "Waiting a little bit"
sleep 10

# Creating Keptn ingress config map
kubectl create configmap -n keptn ingress-config --from-literal=ingress_hostname_suffix=$(kubectl -n keptn get ingress api-keptn-ingress -ojsonpath='{.spec.rules[0].host}') --from-literal=ingress_port=80 --from-literal=ingress_protocol=http --from-literal=istio_gateway=public-gateway.istio-system -oyaml --dry-run | kubectl apply -f -

# Restart helm service
kubectl delete pod -n keptn -lapp.kubernetes.io/name=helm-service

## Done