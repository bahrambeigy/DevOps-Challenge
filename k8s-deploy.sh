#!/bin/bash

########## Required Images ###########
## redis:5-alpine
## python:3.7-alpine
## nginx:alpine
######################################


KUBECTL_BIN="`which kubectl`"
#### Check if kubectl is installed
[[ -z "$KUBECTL_BIN" ]] && echo "[ERROR] Kubectl is NOT INSTALLED! Please install it and then come back" && exit 1 

DOCKER_BIN="`which docker`"
#### Check if docker is installed
[[ -z "$DOCKER_BIN" ]] && echo "[ERROR] Docker is NOT INSTALLED! Please install it and then come back" && exit 1 


#### Building local docker image
$DOCKER_BIN build tornado-server -t tornado-server:latest


### Deploy on k8s
$KUBECTL apply -f tradebyte-k8s-nodeport.yaml

### Done :)
echo -e "\n\n"
echo "######################## DONE #####################"
echo "########## Please open your browser at ############"
echo "##########   http://localhost:31000    ############"
echo "##########              OR             ############"
echo "##########   http://k8s-server:31000   ############"
echo "###################################################"
echo -e "\n\n"
