ROOT = $(shell readlink -f .)
DOCS_ROOT=$(ROOT)/doc/mkdocs

CI_DIR := $(CURDIR)/.circleci
CI_VALIDATOR := $(CI_DIR)/circleci
CI_CONFIG := $(CURDIR)/.circleci/config.yml

.PHONY: ci
ci: ci-config

.PHONY: ci-update
ci-update: $(CI_VALIDATOR)
	$(CI_VALIDATOR) update

.PHONY: ci-config
ci-config: $(CI_VALIDATOR)
	@$(CI_VALIDATOR) config validate -c $(CI_CONFIG) || (echo "$(CI_CONFIG):1:"; exit 1)

# | $(CI_DIR): see https://www.gnu.org/software/make/manual/make.html#Prerequisite-Types
# order-only-prereq
# otherwise cURL will be run everytime
$(CI_VALIDATOR): | $(CI_DIR)
	@curl -fLSs https://circle.ci/cli | DESTDIR="$(CI_DIR)" bash

$(CI_DIR):
	@mkdir $(CI_DIR)

docs: docs-install docs-validate docs-spellcheck docs-report docs-setup docs-build

docs-install:
	@python -mpip install --user --upgrade PyYAML mkdocs pyembed-markdown

docs-validate:
	@$(ROOT)/scripts/validate_mkdocs.py

docs-spellcheck:
	@$(ROOT)/scripts/check-spelling.bash

docs-report:
	@$(ROOT)/scripts/reconcile_docs_to_index.bash

docs-validate:

docs-setup:
	@$(ROOT)/scripts/setup_docs.bash
	@cp $(DOCS_ROOT)/mkdocs.yml $(DOCS_ROOT)/mkdocs.local.yml
	@mkdir -p $(DOCS_ROOT)/theme
	@if [ -f $(DOCS_ROOT)/theme/global.yml ]; then cat $(DOCS_ROOT)/theme/global.yml >> $(DOCS_ROOT)/mkdocs.local.yml; fi

docs-build:
	@echo "\ntheme: null\ntheme_dir: '$(DOCS_ROOT)/theme'\ndocs_dir: '$(DOCS_ROOT)/docs'\n" >> $(DOCS_ROOT)/mkdocs.local.yml
	@mkdocs build -f $(DOCS_ROOT)/mkdocs.local.yml --clean -q --site-dir $(DOCS_ROOT)/site

docs-clean:
	rm -rf $(DOCS_ROOT)/site $(DOCS_ROOT)/docs $(DOCS_ROOT)/mkdocs.local.yml

docs-serve: docs-build
	mkdocs serve --dev-addr=0.0.0.0:9876 -f $(DOCS_ROOT)/mkdocs.local.yml
