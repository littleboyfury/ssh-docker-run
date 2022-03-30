#!/bin/bash

set -e

echo "${INPUT_DEPLOY_TOKEN}" | base64 -d > id_rsa
chmod 700 id_rsa
ssh -o StrictHostKeyChecking=no -i id_rsa ${INPUT_SERVER_HOST} "
          docker login ${INPUT_DOCKER_HOST} -u ${INPUT_DOCKER_USERNAME} -p ${INPUT_DOCKER_PASSWORD}
          docker pull ${INPUT_DOCKER_HOST}/${INPUT_DOCKER_NAMESPACE}/${INPUT_DOCKER_REPO}:${INPUT_IMAGE_TAG}
          docker stop ${INPUT_DOCKER_REPO}
          docker run -itd --rm --name ${INPUT_DOCKER_REPO} -p ${INPUT_CONTAINER_PORT} ${INPUT_DOCKER_HOST}/${INPUT_DOCKER_NAMESPACE}/${INPUT_DOCKER_REPO}:${INPUT_IMAGE_TAG}"
