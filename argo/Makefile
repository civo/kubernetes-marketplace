build: app.yaml

app.yaml:
	@kubectl create --dry-run=client ns -o yaml argocd >> app.yaml
	@echo --- >> app.yaml
	@kubectl apply --dry-run=client -n argocd -o yaml -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml >> app.yaml

.PHONY: clean
clean:
	@rm app.yaml
