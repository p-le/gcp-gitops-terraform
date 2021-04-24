.PHONY: env-prod-init
env-prod-init: WORKDIR := /terraform/environments/prod
env-prod-init:
	${TERRAFORM_PREFIX} init

.PHONY: env-prod-plan
env-prod-plan: WORKDIR := /terraform/environments/prod
env-prod-plan:
	${TERRAFORM_PREFIX} plan

.PHONY: env-prod-apply
env-prod-apply: WORKDIR := /terraform/environments/prod
env-prod-apply:
	${TERRAFORM_PREFIX} apply

.PHONY: env-prod-destroy
env-prod-destroy: WORKDIR := /terraform/environments/prod
env-prod-destroy:
	${TERRAFORM_PREFIX} destroy

