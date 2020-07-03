VERSION="v0.14.0"
build: app.yaml

app.yaml:
	@curl https://storage.googleapis.com/tekton-releases/pipeline/previous/$(VERSION)/release.yaml > app.yaml
	@curl https://storage.googleapis.com/tekton-releases/dashboard/latest/tekton-dashboard-release.yaml >> app.yaml
	@curl https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml >> app.yaml

	# Test final app.yaml for validity
	@echo "Testing validity of app.yaml"
	@kubectl apply -f app.yaml --dry-run=client > /dev/null
	@echo "Clean app.yaml generated"

.PHONY: clean
clean:
	@rm app.yaml
