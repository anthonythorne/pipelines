# Anthony Thorne Docker File
The files necessary to build the Docker image used on website builds. The Dockerfile has been updated to use Ubuntu 22.04 as the base image and now supports multiple versions of Node.js through nvm.

## Commands
The following CLI commands allow for easy build, run, and push during local development. These commands are not necessary to update the Docker image on Docker Hub as auto deploys have been set on pushes to the master branch.

Navigate to the root dir:
* `./build.sh` - Builds the Docker image locally.
* `./run.sh` - Runs the Docker container locally.
* `./push.sh` - Pushes the Docker image to Docker Hub.
