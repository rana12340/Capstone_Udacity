# Step 1:
# Create dockerpath
dockerpath="kuldeeprana/udacapstone"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login
docker image tag udacapstone:latest $dockerpath


# Step 3:
# Push image to a docker repository
docker image push $dockerpath

cmd /c pause | out-null