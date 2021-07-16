build: app.yaml

app.yaml:
	@kubectl create --dry-run=client ns -o yaml argo >> app.yaml
	@echo --- >> app.yaml
	@kubectl apply --dry-run=client -n argo -o yaml -f https://raw.githubusercontent.com/argoproj/argo-workflows/stable/manifests/install.yaml >> app.yaml

.PHONY: clean
clean:
	@rm app.yaml
