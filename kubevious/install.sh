kubectl create namespace kubevious
helm repo add kubevious https://helm.kubevious.io
helm upgrade --atomic -i -n kubevious --version 1.0.3 kubevious kubevious/kubevious
