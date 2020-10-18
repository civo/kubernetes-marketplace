VERSION?="0.41.2"
CHART_URL?="https://grafana.github.io/loki/charts"
# For cli directly installed
CIVO_CMD?="civo"
# For Docker
#CIVO_CMD?=docker run -it --rm -v $HOME/.civo.json:/.civo.json civo/cli:latest
CIVO_TEST_CLUSTER_NAME?=loki
CIVO_KUBECONFIG?=kubeconfig.$(CIVO_TEST_CLUSTER_NAME)
KUBECTL?=kubectl --kubeconfig=$(CIVO_KUBECONFIG)

# Depends on yq from https://github.com/mikefarah/yq for parsing
.PHONY: latest_version
latest_version:
	@curl -s $(CHART_URL)/index.yaml | yq r - 'entries.loki-stack[*].version' | sort -t "." -k1,1n -k2,2n -k3,3n | tail -1

.PHONY: build
build: app.yaml

app.yaml:
# Whatever commands are needed to build the app.yaml.  Kustomize example below
	@echo "apiVersion: helm.cattle.io/v1" > app.yaml
	@echo "kind: HelmChart" >> app.yaml
	@echo "metadata:" >> app.yaml
	@echo "  name: loki-stack" >> app.yaml
	@echo "  namespace: kube-system" >> app.yaml
	@echo "spec:" >> app.yaml
	@echo "  targetNamespace: loki-stack" >> app.yaml
	@echo "  chart: $(CHART_URL)/loki-stack-$(VERSION).tgz" >> app.yaml

	# Test final app.yaml for validity
	@echo "Testing validity of app.yaml"
	@kubectl apply -f app.yaml --dry-run=client > /dev/null
	@echo "Clean app.yaml generated"

.PHONY: clean
clean:
	@rm app.yaml

.PHONY: test
test: $(CIVO_KUBECONFIG) test-noclean cluster-clean

.PHONY: test-keep
test-keep: $(CIVO_KUBECONFIG) test-noclean

.PHONY: test-noclean
test-noclean:
	@echo "Applying manifest and test run"
	@$(KUBECTL) apply -f app.yaml
#	@$(KUBECTL) create -f test-manifests/testjob.yaml  
#	@sleep 10
#	@echo "Checking status of test run"
#	@$(KUBECTL) get job testjob -n r15cookieblog -ojson | jq -r .status.conditions[0].type | grep -q Complete
#	@echo "Success!"

.PHONY: cluster-clean
cluster-clean:
	@echo "Tearing down test cluster!"
	@$(CIVO_CMD) k3s remove -y $(CIVO_TEST_CLUSTER_NAME) || true
	@rm $(CIVO_KUBECONFIG) 

$(CIVO_KUBECONFIG):
	@echo "Creating $(CIVO_TEST_CLUSTER_NAME)"
	@$(CIVO_CMD) k3s create $(CIVO_TEST_CLUSTER_NAME) -n 3 --size g2.small -a prometheus-operator --wait
	@$(CIVO_CMD) k3s config $(CIVO_TEST_CLUSTER_NAME) > $(CIVO_KUBECONFIG)
