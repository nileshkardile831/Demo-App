#!/bin/bash
# This script is used to build, create and push docker images of our demo micro services.

set -xv
cd $home

#build docker image from existing code
./bookinfo/src/build-services.sh

#push docker image to docker registry
./bookinfo/build_push_update_images.sh

# create service and deployment for bookinfo
sudo /usr/bin/kubectl apply -f bookinfo/platform/kube/bookinfo.yaml

# create virtual service, gateway and destination rule for bookinfo
sudo /usr/bin/kubectl apply -f bookinfo/networking/virtual-service-all-v1.yaml
sudo /usr/bin/kubectl apply -f bookinfo/networking/gateway-demoapp.yaml
sudo /usr/bin/kubectl apply -f bookinfo/networking/destination-rule-demo-app.yaml
