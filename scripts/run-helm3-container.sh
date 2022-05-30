#!/usr/bin/env sh

set -e


if [ `docker ps -f status=exited -f name=msts_helm3 | wc -l` -eq "2" ] ; then
  echo Restarting existing container...;
  docker start "msts_helm3";
  docker attach "msts_helm3";
else
  echo Running new container...;
  docker run --name "msts_helm3" \
             -v ~/work:/host-work-dir \
             -w /host-work-dir \
             -it 434875166128.dkr.ecr.us-east-1.amazonaws.com/msts/docker:19.03.15-dind.6 sh;
fi
