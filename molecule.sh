#!/usr/bin/env bash

DOCKER_IMAGE=tock-ansible:1.0.0

if [[ "$(docker images -q $DOCKER_IMAGE 2> /dev/null)" == "" ]]; then
  DOCKER_BUILDKIT=1 docker build --target=runtime -t=$DOCKER_IMAGE .
fi

if [ "$1" = "destroy" ]; then
  docker run --rm -it --privileged --user=root \
      -v /var/run/docker.sock:/var/run/docker.sock:rw -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
      $DOCKER_IMAGE molecule destroy
else
  docker run --rm -it --privileged --user=root \
    -v /var/run/docker.sock:/var/run/docker.sock:rw -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    $DOCKER_IMAGE molecule converge
fi
