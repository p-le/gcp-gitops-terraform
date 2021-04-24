.PHONY: iam-init
iam-init: WORKDIR := /terraform/iam
iam-init:
	$(TERRAFORM_PREFIX) init

.PHONY: iam-plan
iam-plan: WORKDIR := /terraform/iam
iam-plan:
	$(TERRAFORM_PREFIX) plan

.PHONY: iam-apply
iam-apply: WORKDIR := /terraform/iam
iam-apply:
	$(TERRAFORM_PREFIX) apply

.PHONY: iam-destroy
iam-destroy: WORKDIR := /terraform/iam
iam-destroy: cloudbuild-destroy
	$(TERRAFORM_PREFIX) destroy
