#!/bin/bash

# allow access from localhost
xhost +local:*
#DISPLAY=host.docker.internal:0

# run firefox with X11 forwarding and keep running until it quits
docker run -e DISPLAY=$DISPLAY \
  --net=host \
  -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
  jess/firefox

