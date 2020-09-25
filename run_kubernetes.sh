#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="kuldeeprana/udacapstone"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run udacapstone-app --image=$dockerpath --port=80

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
#kubectl port-forward udacapstone-788dc766b5-nphzf 8080:80
kubectl expose deployment udacapstone-app 8080:80

# Open the service --mincube check
# minikube service udacapstone-app

cmd /c pause | out-null