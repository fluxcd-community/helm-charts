# ====================================================================================
# Setup Project

FLUX2_VERSION ?= v0.24.1

# set the shell to bash always
SHELL := /bin/bash

# ====================================================================================
# Setup directories and paths

# a working directory that holds all temporary or working items generated
# during the build. The items will be discarded on a clean build and they
# will never be cached.
ifeq ($(origin WORK_DIR), undefined)
WORK_DIR := $(ROOT_DIR).work
endif

# ====================================================================================
# Colors

BLACK        := $(shell printf "\033[30m")
BLACK_BOLD   := $(shell printf "\033[30;1m")
RED          := $(shell printf "\033[31m")
RED_BOLD     := $(shell printf "\033[31;1m")
GREEN        := $(shell printf "\033[32m")
GREEN_BOLD   := $(shell printf "\033[32;1m")
YELLOW       := $(shell printf "\033[33m")
YELLOW_BOLD  := $(shell printf "\033[33;1m")
BLUE         := $(shell printf "\033[34m")
BLUE_BOLD    := $(shell printf "\033[34;1m")
MAGENTA      := $(shell printf "\033[35m")
MAGENTA_BOLD := $(shell printf "\033[35;1m")
CYAN         := $(shell printf "\033[36m")
CYAN_BOLD    := $(shell printf "\033[36;1m")
WHITE        := $(shell printf "\033[37m")
WHITE_BOLD   := $(shell printf "\033[37;1m")
CNone        := $(shell printf "\033[0m")

# ====================================================================================
# Logger

TIME_LONG	= `date +%Y-%m-%d' '%H:%M:%S`
TIME_SHORT	= `date +%H:%M:%S`
TIME		= $(TIME_SHORT)

INFO	= echo ${TIME} ${BLUE}[ .. ]${CNone}
WARN	= echo ${TIME} ${YELLOW}[WARN]${CNone}
ERR		= echo ${TIME} ${RED}[FAIL]${CNone}
OK		= echo ${TIME} ${GREEN}[ OK ]${CNone}
FAIL	= (echo ${TIME} ${RED}[FAIL]${CNone} && false)

# ====================================================================================
# Commands

all: fetch generate updateversions helmdocs unittests check-diff

fetch:
	@$(INFO) Fetch Flux2 GitRepo
	@mkdir -p ${WORK_DIR}
	@if [ ! -d "${WORK_DIR}/flux2" ]; then \
		cd ${WORK_DIR} && git clone "https://github.com/fluxcd/flux2.git"; \
	fi
	@cd ${WORK_DIR}/flux2 && git fetch origin && git checkout $(FLUX2_VERSION)
	@$(OK) Fetch Flux2 GitRepo

helmdocs:
	helm-docs --chart-search-root=charts --template-files=../_readme_templates.gotmpl

updateversions:
	@for file in $$(ls -1 ./charts/ | tr '\n' ' '); do \
		chartversion=$$(cat ./charts/$${file}/Chart.yaml | grep -E '^version: ' | cut -c10-) ; \
		chartname=$$(cat ./charts/$${file}/Chart.yaml | grep -E '^name: ' | cut -c7-) ; \
		$(INFO) Update chartname and chartversion string in test snapshots for $${file}.; \
		sed -s -i "s/^\([[:space:]]\+helm\.sh\/chart:\).*/\1 $${chartname}-$${chartversion}/" ./charts/$${file}/tests/__snapshot__/*.yaml.snap ; \
        sed -s -i "s/^\([[:space:]]\+app\.kubernetes\.io\/version:\).*/\1 $(subst v,,${FLUX2_VERSION})/" ./charts/$${file}/tests/__snapshot__/*.yaml.snap ; \
		$(INFO) Update appVersion in ./charts/$${file}/Chart.yaml ;\
        sed -s -i "s/^\(appVersion:\).*/\1 $(subst v,,${FLUX2_VERSION})/" ./charts/$${file}/Chart.yaml ; \
	done

generate: fetch
	@$(INFO) Generating CRDs
	@./hack/generate.sh
	@$(OK) Generating CRDs

unittests:
	@helm unittest --helm3 --file tests/*.yaml --file 'tests/**/*.yaml' charts/flux2-multi-tenancy/
	@helm unittest --helm3 --file tests/*.yaml --file 'tests/**/*.yaml' charts/flux2/
	@helm unittest --helm3 --file tests/*.yaml --file 'tests/**/*.yaml' charts/flux2-sync/

check-diff:
	@$(INFO) checking that branch is clean
	@if git status --porcelain | grep . ; \
	then $(FAIL); \
	else $(OK) branch is clean; \
	fi

reviewable: updateversions helmdocs unittests check-diff
