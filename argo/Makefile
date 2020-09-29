build: app.yaml

app.yaml:
	@kubectl create ns argocd --dry-run=client -o yaml > app.yaml
	@kubectl apply -n argocd --dry-run=client -o yaml -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml > app.yaml

.PHONY: clean
clean:
	@rm app.yaml
