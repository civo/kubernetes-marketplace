# Moving to LTS Version - Yearly Support
VERSION?="v0.50.5"
# For cli directly installed
CIVO_CMD?="civo"
# For Docker
#CIVO_CMD=docker run -it --rm -v $HOME/.civo.json:/.civo.json civo/cli:latest
CIVO_TEST_CLUSTER_NAME?=tekton-test
CIVO_KUBECONFIG?=kubeconfig.$(CIVO_TEST_CLUSTER_NAME)
KUBECTL?=kubectl --kubeconfig=$(CIVO_KUBECONFIG)

.PHONY: build
build: tekton.yaml

tekton.yaml:
	@curl https://storage.googleapis.com/tekton-releases/pipeline/previous/$(VERSION)/release.yaml > tekton.yaml
	@echo "---" >> tekton.yaml
	@curl https://storage.googleapis.com/tekton-releases/dashboard/latest/release.yaml >> tekton.yaml
	@echo "---" >> tekton.yaml
	@curl https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml >> tekton.yaml
	@echo "---" >> tekton.yaml
	@curl https://storage.googleapis.com/tekton-releases/triggers/latest/interceptors.yaml >> tekton.yaml

	# Test final tekton.yaml for validity
	@echo "Testing validity of tekton.yaml"
	@kubectl apply -f tekton.yaml --dry-run=client > /dev/null
	@echo "Clean tekton.yaml generated"

.PHONY: clean
clean:
	@rm tekton.yaml

.PHONY: test
test: $(CIVO_KUBECONFIG) test-noclean cluster-clean

.PHONY: test-keep
test-keep: $(CIVO_KUBECONFIG) test-noclean

.PHONY: test-noclean
test-noclean:
	@echo "Applying manifest and test run"
	@$(KUBECTL) apply -f tekton.yaml
	@$(KUBECTL) create -f test-manifests/1-task.yaml
	@$(KUBECTL) create -f test-manifests/2-taskrun.yaml
	@sleep 10
	@echo "Checking status of test run"
	@$(KUBECTL) get -n default taskrun -l tekton.dev/task=hello -ojson | jq -r .items[0].status.conditions[0].type | grep -q Succeeded
	@echo "Success!"



.PHONY: cluster-clean
cluster-clean:
	@echo "Tearing down test cluster!"
	@$(CIVO_CMD) k3s remove -y $(CIVO_TEST_CLUSTER_NAME) || true
	@rm $(CIVO_KUBECONFIG)

$(CIVO_KUBECONFIG):
	@echo "Creating $(CIVO_TEST_CLUSTER_NAME)"
	@$(CIVO_CMD) k3s create $(CIVO_TEST_CLUSTER_NAME) -n 3 --size g4s.kube.small --applications metrics-server --wait
	@$(CIVO_CMD) k3s config $(CIVO_TEST_CLUSTER_NAME) > $(CIVO_KUBECONFIG)
