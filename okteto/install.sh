#!/bin/sh

set -e

subdomain="$CLUSTER_NAME.k8s.civo.com"
email="$EMAIL"
adminToken=$ACCESS_KEY

set +e
for i in {1..30}; do
  kubectl get svc -n=kube-system traefik -ojsonpath='{ .spec.clusterIP }' > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    ingress=$(kubectl get svc -n=kube-system traefik -ojsonpath='{ .spec.clusterIP }')
    echo "traefik installed"
    break
  else
    echo "Traefik not found, will try again"
    sleep 1
  fi
done

helm repo add okteto https://charts.okteto.com
helm repo update
kubectl create namespace okteto --dry-run=client -o yaml | kubectl apply -f - 
kubectl apply -f https://charts.okteto.com/application-crds.yaml

helm upgrade --install civo okteto/okteto-enterprise --namespace okteto -f https://github.com/civo/kubernetes-marketplace/blob/master/okteto/config.yaml --set email="$email" --set adminToken="$adminToken" --set subdomain="$subdomain" --set ingress.ip=$ingress --version 0.8.4
echo 'waiting for 30s for the components to get started'
sleep 30

cat << EOF > issuer.yaml
apiVersion: cert-manager.io/v1alpha2
kind: Issuer
metadata:
  name: letsencrypt-okteto
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: $email
    privateKeySecretRef:
      name: letsencrypt-okteto
    solvers:
    - http01:
        ingress:
          class: traefik
EOF

set +e
for i in {1..10}; do
  kubectl apply -n=okteto -f issuer.yaml
  if [ $? -eq 0 ]; then
    echo "Successfully created issuer"
    break
  else
    echo "Could not create issuer, will wait"
    sleep 10
  fi
done

echo 'waiting for the SSL certificates to get generated'

kubectl rollout status deployment/civo-okteto-enterprise-api -n=okteto
kubectl rollout status statefulset/civo-okteto-enterprise-buildkit -n=okteto
