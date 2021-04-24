.PHONY: env-dev-init
env-dev-init: WORKDIR := /terraform/environments/dev
env-dev-init:
	${TERRAFORM_PREFIX} init

.PHONY: env-dev-plan
env-dev-plan: WORKDIR := /terraform/environments/dev
env-dev-plan:
	${TERRAFORM_PREFIX} plan

.PHONY: env-dev-apply
env-dev-apply: WORKDIR := /terraform/environments/dev
env-dev-apply:
	${TERRAFORM_PREFIX} apply

.PHONY: env-dev-destroy
env-dev-destroy: WORKDIR := /terraform/environments/dev
env-dev-destroy:
	${TERRAFORM_PREFIX} destroy
