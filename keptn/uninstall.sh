#!/bin/bash

# ============================================================================================
# Create a kubeconfig file from daemon's service account
# https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengaddingserviceaccttoken.htm
# ============================================================================================
TOKENNAME=`kubectl -n kubemart-system get serviceaccount/kubemart-daemon-svc-acc -o jsonpath='{.secrets[0].name}'`
TOKEN=`kubectl -n kubemart-system get secret $TOKENNAME -o jsonpath='{.data.token}'| base64 --decode`

kubectl config set-credentials kubemart-daemon-svc-acc --token=$TOKEN
kubectl config set-context ephemeral --user=kubemart-daemon-svc-acc
kubectl config use-context ephemeral

# ============================================================================================
# Uninstall Keptn
# ============================================================================================
curl -sL https://get.keptn.sh | bash
keptn uninstall --yes
