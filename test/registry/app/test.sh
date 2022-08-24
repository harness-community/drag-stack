#!/usr/bin/env bash

set -euxo pipefail
 
echo -n "${DOLLAR}IMAGE_REGISTRY_PASSWORD" | \
  docker login "${DOLLAR}MY_REGISTRY_URL" \
    --username "${DOLLAR}IMAGE_REGISTRY_USER" --password-stdin

# Internal 
docker pull gcr.io/google-samples/hello-app:1.0
docker tag gcr.io/google-samples/hello-app:1.0 "${DOLLAR}MY_REGISTRY_URL/example/hello-app:1.0"
docker push  "${DOLLAR}MY_REGISTRY_URL/example/hello-app:1.0"

# External
# docker pull gcr.io/google-samples/hello-app:1.0
# docker tag gcr.io/google-samples/hello-app:1.0 "${DOLLAR}MY_REGISTRY_EXTERNAL_URL/example/hello-app:1.0"
# docker push  "${DOLLAR}MY_REGISTRY_EXTERNAL_URL/example/hello-app:1.0"