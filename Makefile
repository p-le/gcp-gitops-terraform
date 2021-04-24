BASE_PATH 				:= $(shell pwd)
SERVICE_ACCOUNT_FILE	:= phu-le-it-dfe5fccbb593.json
TERRAFORM_VERSION 		:= 0.15.0

# Macros
define TERRAFORM_PREFIX
	docker container run -it --rm \
		-v $(BASE_PATH)/terraform:/terraform \
		-v $(BASE_PATH)/gcloud/certs:/certs \
		-e GOOGLE_CREDENTIALS=/certs/$(SERVICE_ACCOUNT_FILE) \
		-w ${WORKDIR} \
		hashicorp/terraform:${TERRAFORM_VERSION}
endef

.PHONY: setup
setup:
	@gsutil cp gs://phu-le-credentials/$(SERVICE_ACCOUNT_FILE) gcloud/certs/
	@echo "[core]\nproject = phu-le-it" > ./gcloud/config/configurations/config_default
	@echo "[auth]\ncredential_file_override = /certs/$(SERVICE_ACCOUNT_FILE)" >> ./gcloud/config/configurations/config_default
	$(MAKE) iam-init
	$(MAKE) cloudbuild-init
	$(MAKE) env-dev-init
	$(MAKE) env-prod-init

components := iam cloudbuild env-dev env-prod
include $(addprefix mk/, $(addsuffix .mk, $(components)))

# .PHONY: init
# init: $(addsuffix -init, $(components))
# # $(addsuffix -init, $(components)): WORKDIR := $(addprefix terraform/, $(components))
# $(addsuffix -init, $(components)): WORKDIR := $(addprefix terraform/, $@)
# $(addsuffix -init, $(components)): $(addsuffix -init, $(components))
# 	@echo $@ $^

# $(addsuffix -plan, $(components)):
# 	@echo $@ $(WORKDIR)
# $(addsuffix -apply, $(components)):
# 	@echo $@ $(WORKDIR)
# $(addsuffix -destroy, $(components)):
# 	@echo $@ $(WORKDIR)

.PHONY: clean
clean:
	$(MAKE) iam-destroy
	$(MAKE) cloudbuild-destroy
	$(MAKE) env-dev-destroy
	$(MAKE) env-prod-destroy
