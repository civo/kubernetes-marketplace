kubectl create namespace kubevious
helm repo add kubevious https://helm.kubevious.io
helm upgrade --atomic -i -n kubevious --version 0.8.15  kubevious kubevious/kubevious
