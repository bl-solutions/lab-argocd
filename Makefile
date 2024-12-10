CONFIG_FOLDER := ./config
CLUSTER_NAME := argocd
CONTEXT_NAME := kind-$(CLUSTER_NAME)


up:
	@wrappers/cluster.sh create $(CLUSTER_NAME)
	@wrappers/argocd.sh $(CONTEXT_NAME) install

down:
	@wrappers/cluster.sh delete $(CLUSTER_NAME)

uninstall_argocd:
	@wrappers/argocd.sh $(CONTEXT_NAME) uninstall

expose_argocd:
	@wrappers/argocd.sh $(CONTEXT_NAME) expose
