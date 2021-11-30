# ====================================================================================
# Setup Project

FLUX2_VERSION ?= v0.24.0

all: fetch generate helm-docs

fetch:
	@if [ ! -d ".work/flux2" ]; then \
		cd .work && git clone "https://github.com/fluxcd/flux2.git"; \
	fi
	@cd .work/flux2 && git fetch origin && git checkout $(FLUX2_VERSION)

generate:
# ToDo: no override since we have manipulate step
	@cd .work/flux2 && manifests/scripts/bundle.sh && cp cmd/flux/manifests/* ../../charts/flux2/templates

helm-docs:
	helm-docs

# manipulate:
# ToDo:
# 	- split files in crds & deployments
# 	- insert if/end to

# ====================================================================================
