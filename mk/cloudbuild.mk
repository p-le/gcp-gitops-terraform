.PHONY: cloudbuild-init
cloudbuild-init: WORKDIR := /terraform/cloudbuild
cloudbuild-init:
	${TERRAFORM_PREFIX} init

.PHONY: cloudbuild-plan
cloudbuild-plan: WORKDIR := /terraform/cloudbuild
cloudbuild-plan:
	${TERRAFORM_PREFIX} plan

.PHONY: cloudbuild-apply
cloudbuild-apply: WORKDIR := /terraform/cloudbuild
cloudbuild-apply: iam-apply
	${TERRAFORM_PREFIX} apply

.PHONY: cloudbuild-destroy
cloudbuild-destroy: WORKDIR := /terraform/cloudbuild
cloudbuild-destroy:
	${TERRAFORM_PREFIX} destroy
