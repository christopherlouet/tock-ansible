#!/usr/bin/env bash

DOCKER_IMAGE=tock-ansible:0.1.0
DOCKER_VOLUMES="-v $HOME/.ssh:/home/app/.ssh
  -v $(pwd)/collections:/app/collections
  -v $(pwd)/inventory:/app/inventory
  -v $(pwd)/roles:/app/roles
  -v $(pwd)/roles.galaxy:/app/roles.galaxy
  -v $(pwd)/ansible.cfg:/app/ansible.cfg
  -v $(pwd)/main.yml:/app/main.yml
  -v $(pwd)/requirements.yml:/app/requirements.yml"

if [[ "$(docker images -q $DOCKER_IMAGE 2> /dev/null)" == "" ]]; then
  DOCKER_BUILDKIT=1 docker build --target=runtime -t=$DOCKER_IMAGE .
fi

if [ -z $1 ]; then
  CMD="ansible-playbook main.yml"
else
  CMD=$@
fi

# Installing roles and collections
CMD_INSTALL="ansible-galaxy collection install --requirements-file requirements.yml"
docker run --rm -it $DOCKER_VOLUMES $DOCKER_IMAGE $CMD_INSTALL

# Run command in container
docker run --rm -it $DOCKER_VOLUMES $DOCKER_IMAGE $CMD
