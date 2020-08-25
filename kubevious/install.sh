kubectl create namespace kubevious
helm repo add kubevious https://helm.kubevious.io
helm upgrade --atomic -i -n kubevious --version 0.6.36  --set ingress.enabled=true  kubevious kubevious/kubevious
