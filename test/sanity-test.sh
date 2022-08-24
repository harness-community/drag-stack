#!/usr/bin/env bash

set -euo pipefail

# sanity checks
printf "\nSanity Checks\n"

# Docker push
docker pull gcr.io/google-samples/hello-app:1.0
docker tag gcr.io/google-samples/hello-app:1.0 "localhost:31081/hello-app:1.0"
docker push "localhost:31081/hello-app:1.0"

# Kubectl
kubectl 
kubectl create deployment hello-server --image="nexus.infra.svc.cluster.local/hello-app:1.0"
kubectl rollout status deployment.apps/hello-server --timeout=30s
kubectl delete deployment.apps/hello-server