VERSION="v0.14.0"
# For cli directly installed
#CIVO_CMD="civo"
# For Docker
CIVO_CMD=docker run -it --rm -v /home/steve/.civo.json:/.civo.json civo/cli:latest
CIVO_TEST_CLUSTER_NAME=tekton-test
CIVO_KUBECONFIG=kubeconfig.$(CIVO_TEST_CLUSTER_NAME)
KUBECTL=kubectl --kubeconfig=$(CIVO_KUBECONFIG)

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

.PHONY: test
test:
	@echo "Creating $(CIVO_TEST_CLUSTER_NAME)"
	@$(CIVO_CMD) k3s create $(CIVO_TEST_CLUSTER_NAME) -n 3 --size g2.small --wait
	@$(CIVO_CMD) k3s config $(CIVO_TEST_CLUSTER_NAME) > $(CIVO_KUBECONFIG)
	@echo "Applying manifest and test run"
	@$(KUBECTL) apply -f app.yaml
	@$(KUBECTL) create -f test-manifests/1-task.yaml 
	@$(KUBECTL) create -f test-manifests/2-taskrun.yaml 
	@sleep 10
	@echo "Checking status of test run"
	@$(KUBECTL) get taskrun -l tekton.dev/task=hello -ojson | jq -r .items[0].status.conditions[0].type | grep -q Succeeded
	@echo "Success!  Tearing down test cluster"
	@$(CIVO_CMD) k3s remove -y $(CIVO_TEST_CLUSTER_NAME)
	@rm $(CIVO_KUBECONFIG)