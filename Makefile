DOCKER_TAG ?= ghcr.io/bhaan/postgres-flextended
DOCKER_TAG_VERSION ?= latest

.PHONY: build push
 
build:
	docker build --build-arg VERSION=$$(fly version | cut -d' ' -f2) --tag ${DOCKER_TAG}:${DOCKER_TAG_VERSION} --platform linux/amd64 .

push:
	docker push ${DOCKER_TAG}:${DOCKER_TAG_VERSION}
