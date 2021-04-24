BASE_PATH = $(shell pwd)
SERVICE_ACCOUNT_FILE = phu-le-it-dfe5fccbb593.json
TERRAFORM_VERSION = 0.15.0

define TERRAFORM_PREFIX
	docker container run -it --rm \
		-v ${BASE_PATH}/terraform:/terraform \
		-v ${BASE_PATH}/gcloud/certs:/certs \
		-e GOOGLE_CREDENTIALS=/certs/${SERVICE_ACCOUNT_FILE} \
		-w ${WORKDIR} \
		hashicorp/terraform:${TERRAFORM_VERSION}
endef

.PHONY: setup
setup:
	@gsutil cp gs://phu-le-credentials/${SERVICE_ACCOUNT_FILE} gcloud/certs/
	@echo "[core]\nproject = phu-le-it" > ./gcloud/config/configurations/config_default
	@echo "[auth]\ncredential_file_override = /certs/${SERVICE_ACCOUNT_FILE}" >> ./gcloud/config/configurations/config_default
	$(MAKE) iam-init
	$(MAKE) env-dev-init
	$(MAKE) env-prod-init

#### IAM Rules
.PHONY: iam-init
WORKDIR = /terraform/iam
iam-init:
	${TERRAFORM_PREFIX} init

.PHONY: iam-plan
WORKDIR = /terraform/iam
iam-plan:
	${TERRAFORM_PREFIX} plan

.PHONY: iam-apply
WORKDIR = /terraform/iam
iam-apply:
	${TERRAFORM_PREFIX} apply

.PHONY: iam-destroy
WORKDIR = /terraform/iam
iam-destroy:
	${TERRAFORM_PREFIX} destroy

#### Cloud Build Rules
.PHONY: cloudbuild-init
WORKDIR = /terraform/cloudbuild
cloudbuild-init:
	${TERRAFORM_PREFIX} init

.PHONY: cloudbuild-plan
WORKDIR = /terraform/cloudbuild
cloudbuild-plan:
	${TERRAFORM_PREFIX} plan

.PHONY: cloudbuild-apply
WORKDIR = /terraform/cloudbuild
cloudbuild-apply:
	${TERRAFORM_PREFIX} apply

.PHONY: cloudbuild-destroy
WORKDIR = /terraform/cloudbuild
cloudbuild-destroy:
	${TERRAFORM_PREFIX} destroy

#### Environment DEV Rules
.PHONY: env-dev-init
WORKDIR = /terraform/environments/dev
env-dev-init:
	${TERRAFORM_PREFIX} init

.PHONY: env-dev-plan
WORKDIR = /terraform/environments/dev
env-dev-plan:
	${TERRAFORM_PREFIX} plan

.PHONY: env-dev-apply
WORKDIR = /terraform/environments/dev
env-dev-apply:
	${TERRAFORM_PREFIX} apply

.PHONY: env-dev-destroy
WORKDIR = /terraform/environments/dev
env-dev-destroy:
	${TERRAFORM_PREFIX} destroy

#### Environment PROD Rules
.PHONY: env-prod-init
WORKDIR = /terraform/environments/prod
env-prod-init:
	${TERRAFORM_PREFIX} init

.PHONY: env-prod-plan
env-prod-plan:
	${TERRAFORM_PREFIX} plan

.PHONY: env-prod-apply
env-prod-apply:
	${TERRAFORM_PREFIX} apply

.PHONY: env-prod-destroy
env-prod-destroy:
	${TERRAFORM_PREFIX} destroy


#### Others Rules

# Example 1: make gcloud ARG=version
# Example 2: make gcloud ARG="config list"
# Example 3: make gcloud ARG="auth list"
# Example 4: make gcloud ARG="projects list"
.PHONY: gcloud
gcloud:
	@docker container run -it --rm \
		-v ${BASE_PATH}/gcloud/config:/gcloud/config \
		-v ${BASE_PATH}/gcloud/certs:/certs \
		-e CLOUDSDK_CONFIG=/gcloud/config \
		google/cloud-sdk \
		gcloud $(ARG)
