#!/bin/bash
# This script is used to provision aws resources using terraform.

set -xv

home_dir=/var/lib/jenkins/workspace/Demo-App-Deployment/sample-app
cd $home_dir

# create service and deployment for bookinfo
sudo /usr/bin/kubectl apply -f bookinfo/platform/kube/bookinfo.yaml

# create virtual service, gateway and destination rule for bookinfo
sudo /usr/bin/kubectl apply -f bookinfo/networking/virtual-service-all-v1.yaml
sudo /usr/bin/kubectl apply -f bookinfo/networking/gateway-demoapp.yaml
sudo /usr/bin/kubectl apply -f bookinfo/networking/destination-rule-demo-app.yaml
