#!/bin/bash

# Check if DOCKER_IMAGE argument is passed
if [ -z "$1" ]; then
  echo "Error: Docker image is not provided."
  echo "Usage: $0 <docker_image>"
  exit 1
fi

# Set DOCKER_IMAGE to the first argument
DOCKER_IMAGE=$1

# Pull the Docker image if needed (optional)
echo "Pulling Docker image: ${DOCKER_IMAGE}"
docker pull ${DOCKER_IMAGE}

# Run the Docker container to deploy the application
echo "Running the Docker container with image: ${DOCKER_IMAGE}"
docker run -it -d \
  --name spring-boot-app \
  -p 8082:8082 \
  ${DOCKER_IMAGE}

echo "Deployment successful! The app is running on port 8080."
