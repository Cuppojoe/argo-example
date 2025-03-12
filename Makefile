CHART_VERSION ?= 0.2.4
publish-chart:
	helm package ./chart -d ./published-charts --version $(CHART_VERSION)
	helm repo index . --url https://cuppojoe.github.io/argo-example
	git add ./published-charts/argo-example-$(CHART_VERSION).tgz || true
	git stage ./published-charts/argo-example-$(CHART_VERSION).tgz
	git stage ./index.yaml
	git commit -m "Add or update chart argo-example version $(CHART_VERSION)" || true
	git push
