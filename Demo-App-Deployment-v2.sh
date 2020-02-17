#!/bin/bash
# This script is used to provision aws resources using terraform.

set -xv

home_dir=/var/lib/jenkins/workspace/Demo-App-Deployment/sample-app
cd $home_dir

# provision version two of bookinfo app (k8 deployment and service)
sudo /usr/bin/kubectl apply -f bookinfo/platform/kube/bookinfo_v2.yaml

# add support for version 2 in virtual service and destination rule along with request weight
sudo /usr/bin/kubectl apply -f bookinfo/networking/virtual-service-demo-app-v2.yaml
sudo /usr/bin/kubectl apply -f bookinfo/networking/destination-rule-demo-app-v2.yaml
