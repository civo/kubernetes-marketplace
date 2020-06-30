build: app.yaml

app.yaml:
	@kubectl create ns kubedb --dry-run -o yaml > app.yaml
	@helm template kubedb-op appscode/kubedb --version v0.12.0 --namespace kubedb >> app.yaml
	@helm template kubedb-op-cat appscode/kubedb-catalog --version v0.12.0 --namespace kubedb >> app.yaml

.PHONY: clean
clean:
	@rm app.yaml
