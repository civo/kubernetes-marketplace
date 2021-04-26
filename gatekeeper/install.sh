kubectl create ns opa
helm repo add gatekeeper https://open-policy-agent.github.io/gatekeeper/charts
helm repo update
helm install opa-gatekeeper gatekeeper/gatekeeper -n opa