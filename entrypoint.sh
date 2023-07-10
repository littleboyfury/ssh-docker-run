#!/bin/bash

set -e

echo "${INPUT_DEPLOY_TOKEN}" | base64 -d > id_rsa
chmod 700 id_rsa
ssh -o StrictHostKeyChecking=no -i id_rsa ${INPUT_SERVER_HOST} "
          docker login ${INPUT_DOCKER_HOST} -u ${INPUT_DOCKER_USERNAME} -p ${INPUT_DOCKER_PASSWORD}
          docker pull ${INPUT_DOCKER_IMAGE_URL}:${INPUT_DOCKER_IMAGE_TAG}
          docker stop ${INPUT_DOCKER_CONTAINER_NAME}
          docker run ${INPUT_DOCKER_OPTIONS} ${INPUT_DOCKER_IMAGE_URL}:${INPUT_DOCKER_IMAGE_TAG}"
