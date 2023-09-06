#!/usr/bin/env bash

DOCKER_IMAGE=tock-ansible:1.0.0

if [[ "$(docker images -q $DOCKER_IMAGE 2> /dev/null)" == "" ]]; then
  DOCKER_BUILDKIT=1 docker build --target=runtime -t=$DOCKER_IMAGE .
fi

# Run the playbook
docker run --rm -it \
  -v $HOME/.ssh:/home/app/.ssh \
  $DOCKER_IMAGE ansible-playbook main.yml
