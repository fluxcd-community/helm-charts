# ====================================================================================
# Setup Project

FLUX2_VERSION ?= v0.41.1

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

TIME_LONG  = `date +%Y-%m-%d' '%H:%M:%S`
TIME_SHORT = `date +%H:%M:%S`
TIME       = $(TIME_SHORT)

INFO = echo ${TIME} ${BLUE}[ .. ]${CNone}
WARN = echo ${TIME} ${YELLOW}[WARN]${CNone}
ERR  = echo ${TIME} ${RED}[FAIL]${CNone}
OK   = echo ${TIME} ${GREEN}[ OK ]${CNone}
FAIL = (echo ${TIME} ${RED}[FAIL]${CNone} && false)

# ====================================================================================
# Commands

all: fetch generate update.appversion helmdocs unittests check-diff

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

update.chartversion:
	@if [ "$(chartyamlpath)" = "" ]; then \
		echo "Error: Please specify the path to the Chart.ymal: eg. chartyamlpath=./charts/flux2/Chart.yaml"; \
		$(FAIL) \
	fi
	@RE='[^0-9]*\([0-9]*\)[.]\([0-9]*\)[.]\([0-9]*\)\([0-9A-Za-z-]*\)' ; \
	base=$$(git show main:$(chartyamlpath) | grep "version:" | cut -c10-) ; \
	MAJOR=`echo $${base} | sed -e "s#$${RE}#\1#"` ; \
	MINOR=`echo $${base} | sed -e "s#$${RE}#\2#"` ; \
	PATCH=`echo $${base} | sed -e "s#$${RE}#\3#"` ; \
	$(INFO) "Old Chart version: $${MAJOR}.$${MINOR}.$${PATCH} in $(chartyamlpath)" ; \
	case '$(semvertype)' in \
		major) \
			let MAJOR+=1 \
			let MINOR=0 \
			let PATCH=0 \
			;; \
		minor) \
			let MINOR+=1 \
			let PATCH=0 \
			;; \
		patch) \
			let PATCH+=1 \
			;; \
		*) \
			echo "Error: Please specify one of the following bump types: semvertype=(major|minor|patch)"; \
			$(FAIL) ; exit 1 ;\
	esac; \
	sed -s -i "s/^\(version:\).*/\1 $${MAJOR}.$${MINOR}.$${PATCH}/" $(chartyamlpath) || $(FAIL); \
	$(OK) New Chart version: $${MAJOR}.$${MINOR}.$${PATCH};
	@make update.appversion

update.appversion:
	@for file in $$(ls -1 ./charts/ | tr '\n' ' '); do \
		chartversion=$$(cat ./charts/$${file}/Chart.yaml | grep -E '^version: ' | cut -c10-) ; \
		chartname=$$(cat ./charts/$${file}/Chart.yaml | grep -E '^name: ' | cut -c7-) ; \
		$(INFO) Update chartname and chartversion string in test snapshots for $${file}.; \
		sed -s -i "s/^\([[:space:]]\+helm\.sh\/chart:\).*/\1 $${chartname}-$${chartversion}/" ./charts/$${file}/tests/__snapshot__/*.yaml.snap ; \
		sed -s -i "s/^\([[:space:]]\+app\.kubernetes\.io\/version:\).*/\1 $(subst v,,${FLUX2_VERSION})/" ./charts/$${file}/tests/__snapshot__/*.yaml.snap ; \
		sed -s -i "s/^\([[:space:]]\+app\.kubernetes\.io\/version:\).*/\1 $(subst v,,${FLUX2_VERSION})/" ./charts/$${file}/tests/__snapshot__/*.yaml.snap ; \
		$(INFO) Update appVersion in ./charts/$${file}/Chart.yaml ;\
		sed -s -i "s/^\(appVersion:\).*/\1 $(subst v,,${FLUX2_VERSION})/" ./charts/$${file}/Chart.yaml ; \
		$(OK) "Version strings updated" ; \
	done

generate: fetch
	@$(INFO) Generating CRDs
	@./hack/generate.sh
	@$(OK) Generating CRDs

unittests:
	@helm unittest --helm3 --file tests/*.yaml --file 'tests/**/*.yaml' charts/flux2-multi-tenancy/
	@helm unittest --helm3 --file tests/*.yaml --file 'tests/**/*.yaml' charts/flux2/
	@helm unittest --helm3 --file tests/*.yaml --file 'tests/**/*.yaml' charts/flux2-sync/
	@helm unittest --helm3 --file tests/*.yaml --file 'tests/**/*.yaml' charts/flux2-notification/

check-diff:
	@$(INFO) checking that branch is clean
	@if git status --porcelain | grep . ; \
	then $(FAIL); \
	else $(OK) branch is clean; \
	fi

reviewable: update.appversion helmdocs unittests check-diff

.PHONY: all fetch helmdocs update.chartversion update.appversion generate unittests check-diff reviewable


define FLUXCHART_MAKE_HELP
Targets:
    generate              Generate a new chart files from flux version specified at start of Makefile.
    helmdocs              Update README.md files in chart directories.
    unittests             Run helm unittest against the charts.
    update.appversion     Update version strings in testfiles and Chart.yaml.
    update.chartversion   Bump Semver chart version.
    reviewable            Run to see if everything fits.

endef
export FLUXCHART_MAKE_HELP

.PHONY: help
help:
	@echo "$$FLUXCHART_MAKE_HELP"
