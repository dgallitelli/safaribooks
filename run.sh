#!/bin/sh/

BOOK_ID=$1
EMAIL=$2
PASSWORD=$3

echo "Building quietly the image with name safaribooks. Please wait ..."
# Build the docker image
docker build -q -t safaribooks .
echo "Build complete."

# Run the docker image with the parameters provided
CWD=$(pwd)
docker run -it --rm -v $CWD/Books:/safaribooks/Books safaribooks --cred $EMAIL:$PASSWORD --kindle $BOOK_ID