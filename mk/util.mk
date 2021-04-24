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
