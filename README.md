# anttp-docker

## What is this?

anttp web container: https://github.com/traktion/anttp

## Configuration

You can either pull the latest image from Docker Hub:

`docker pull traktion/anttp:latest`

Or build your own:

`docker build -t traktion/anttp .`

Then run with:

`docker run -p 0.0.0.0:8080:8080 traktion/anttp`
