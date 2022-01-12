build: app.yaml

app.yaml:
	@kubectl create --dry-run=client ns -o yaml argo > app.yaml
	@echo --- >> app.yaml
	@kubectl -n argo create configmap workflow-controller-configmap --dry-run=client -o yaml --from-file=config >> app.yaml
	@echo --- >> app.yaml
	@kubectl apply --dry-run=client -n argo -o json -f https://raw.githubusercontent.com/argoproj/argo-workflows/stable/manifests/install.yaml | \
		jq 'del(.items[] | select(.metadata.name == "workflow-controller-configmap"))' | \
		kubectl apply --dry-run=client -n argo -o yaml -f - >> app.yaml
	@sed -i -e '/^version:/d' manifest.yaml
	@grep -m1 'image: .*/workflow-controller:' app.yaml | cut -d: -f3 | sed 's/\(.*\)/version: "\1"/' >> manifest.yaml
.PHONY: clean
clean:
	@rm app.yaml
