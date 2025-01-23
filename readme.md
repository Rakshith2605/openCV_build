# OpenCV Docker Development Environment
A streamlined Docker-based solution for OpenCV development that eliminates common build and dependency issues. This repository provides a pre-configured environment with OpenCV and Python, making it easy to start working with computer vision projects without worrying about system-level configurations. Perfect for developers who want to avoid the hassle of OpenCV installation and focus on their computer vision applications.
The setup includes ready-to-use Docker commands, build scripts, and development environment configurations that work consistently across different platforms.

# Build Instructions
`chmod +x main.sh`

`./main.sh`


# To Use a container
## Start container with current directory
`docker run -it -v $(pwd):/app opencv-app bash`

## Start with input/output directories
`docker run -it -v $(pwd):/app -v $(pwd)/input:/app/input -v $(pwd)/output:/app/output opencv-app bash`

## Run in detached mode
`docker run -d opencv-app`

## Start with working directory
`docker run -it -w /app opencv-app bash`

## Run Python script directly
`docker run -it -v $(pwd):/app opencv-app python /app/script.py`

## Run with all mounts and Python script
`docker run -it -v $(pwd):/app -v $(pwd)/input:/app/input -v $(pwd)/output:/app/output opencv-app python /app/script.py`

## Access container shell
`docker exec -it container_name bash`

## Run specific Python command
`docker exec container_name python script.py`

## Check OpenCV version
`docker run --rm opencv-app python -c "import cv2; print(cv2.__version__)"`

## Check OpenCV build information
`docker run --rm opencv-app python -c "import cv2; print(cv2.getBuildInformation())"`

## Copy files from container to host
`docker cp container_name:/app/file.txt ./local/path/`

## Copy files from host to container
`docker cp ./local/file.txt container_name:/app/`

## List running containers
`docker ps`

## List all containers (including stopped)
`docker ps -a`

## List container IDs only
`docker ps -q`

## Stop container gracefully
`docker stop container_name`

## Stop container immediately
`docker kill container_name`

## Stop all containers
`docker stop $(docker ps -a -q)`

## Remove container
`docker rm container_name`

## Remove all stopped containers
`docker container prune`

## Remove all containers (forced)
`docker rm -f $(docker ps -a -q)`

## Clean up entire system
`docker system prune -a`

## Pause container
`docker pause container_name`

## Unpause container
`docker unpause container_name`

## Restart container
`docker restart container_name`

## Restart all running containers
`docker restart $(docker ps -q)`

## Fix permission issues
`sudo chown -R $USER:$USER input output`

## Mount multiple directories
`docker run -it -v $(pwd):/app -v /path/to/data:/data opencv-app bash`

## Development environment with all options
`docker run -it \
    -v $(pwd):/app \
    -v $(pwd)/input:/app/input \
    -v $(pwd)/output:/app/output \
    -w /app \
    --name opencv_dev \
    opencv-app bash`

