#!/bin/bash

minikube_ip=$(minikube ip)
running_count=$(minikube status | grep -c "Running")

if [ $running_count -lt 1 ]; then
  echo "minikube: Stopped"
else
  echo "minikube: Running ($running_count) | $minikube_ip"
fi


