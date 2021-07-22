CIVO_CMD?="civo"
CIVO_TEST_CLUSTER_NAME?=twingate-test
CIVO_KUBECONFIG?=kubeconfig.$(CIVO_TEST_CLUSTER_NAME)
KUBECTL?=kubectl --kubeconfig=$(CIVO_KUBECONFIG)


.PHONY: cluster-setup
cluster-setup:
	@echo "Creating $(CIVO_TEST_CLUSTER_NAME)"
	@$(CIVO_CMD) k3s create $(CIVO_TEST_CLUSTER_NAME) -n 3 --size g3.k3s.small --region NYC1 --wait
	@$(CIVO_CMD) k3s config $(CIVO_TEST_CLUSTER_NAME) > $(CIVO_KUBECONFIG)


.PHONY: cluster-teardown
cluster-teardown:
	@echo "Tearing down test cluster!"
	@$(CIVO_CMD) k3s remove -y $(CIVO_TEST_CLUSTER_NAME) || true
	@rm $(CIVO_KUBECONFIG)


.PHONY: deploy-connector
deploy-connector:
	@$(KUBECTL) apply -f app.yaml


.PHONY: deploy-internal-site
internal-site:
	@$(KUBECTL) apply -f test/internal-site.yaml


.PHONY: deploy
deploy: deploy-connector internal-site
