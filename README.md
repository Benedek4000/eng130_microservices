# Microservices

Microservice architecture is a pattern, in which applications are arranged 
loosely, communicating using lightweight protocols.

## Containerisation

Containers let the user deploy several applications on the same machine. 
The shared parts of the machine are read-only.

## Docker

Docker is a product, which lets the user deploy software products using 
containers, on the same machine.

docker help:
```yaml
Usage:  docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Options:
      --config string      Location of client config files (default
                           "C:\\Users\\bened\\.docker")
  -c, --context string     Name of the context to use to connect to the
                           daemon (overrides DOCKER_HOST env var and
                           default context set with "docker context use")
  -D, --debug              Enable debug mode
  -H, --host list          Daemon socket(s) to connect to
  -l, --log-level string   Set the logging level
                           ("debug"|"info"|"warn"|"error"|"fatal")
                           (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default
                           "C:\\Users\\bened\\.docker\\ca.pem")
      --tlscert string     Path to TLS certificate file (default
                           "C:\\Users\\bened\\.docker\\cert.pem")
      --tlskey string      Path to TLS key file (default
                           "C:\\Users\\bened\\.docker\\key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Management Commands:
  builder     Manage builds
  buildx*     Docker Buildx (Docker Inc., v0.9.1)
  compose*    Docker Compose (Docker Inc., v2.12.2)
  config      Manage Docker configs
  container   Manage containers
  context     Manage contexts
  dev*        Docker Dev Environments (Docker Inc., v0.0.3)
  extension*  Manages Docker extensions (Docker Inc., v0.2.13)
  image       Manage images
  manifest    Manage Docker image manifests and manifest lists
  network     Manage networks
  node        Manage Swarm nodes
  plugin      Manage plugins
  sbom*       View the packaged-based Software Bill Of Materials (SBOM) for an image (Anchore Inc., 0.6.0)
  scan*       Docker Scan (Docker Inc., v0.21.0)
  secret      Manage Docker secrets
  service     Manage services
  stack       Manage Docker stacks
  swarm       Manage Swarm
  system      Manage Docker
  trust       Manage trust on Docker images
  volume      Manage volumes

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  build       Build an image from a Dockerfile
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container's filesystem
  events      Get real time events from the server
  exec        Run a command in a running container
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  images      List images
  import      Import the contents from a tarball to create a filesystem image
  info        Display system-wide information
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  login       Log in to a Docker registry
  logout      Log out from a Docker registry
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  ps          List containers
  pull        Pull an image or a repository from a registry
  push        Push an image or a repository to a registry
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  run         Run a command in a new container
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  search      Search the Docker Hub for images
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  version     Show the Docker version information
  wait        Block until one or more containers stop, then print their exit codes

Run 'docker COMMAND --help' for more information on a command.

To get more help with docker, check out our guides at https://docs.docker.com/go/guides/

```

### Containers

A container is a unit of a software package and its dependencies.

### Container images

Container images are lightweight, standalone, executable software packages.
They include everything needed for the software to run, including code, 
dependencies, tools, libraries, etc.

### Container lifecycle

![docker lifecycle diagram](https://github.com/Benedek4000/eng130_microservices/blob/main/images/docker_lifecycle.png)

- Create:
  - Container is created from docker image.
- Running:
  - Container is executing commands.
- Paused:
  - Executing commands has been paused.
- Stopped:
  - The container's main processes are shut down gracefully.
- Killed:
  - The container's main processes are shut down abruptly.

### Example

- get nginx docker image: `docker pull nginx`  
- run nginx image in background: `docker run -d -p 80:80 nginx`  
- copy html file to display in browser: `docker cp [local file path] [container id]:[file name]`  
- log into docker container: `docker exec -it [container id] bash`  
- move html file into correct location: `mv [file name] /usr/share/nginx/html/[file name]`  
- to exit: `exit`
- check if it works by typing `localhost` into browser
- create docker image: `docker commit nginx [username]/new_nginx`

### Create new docker image using Dockerfile

- use already existing image
- modify it
- save it
- push it to docker hub

define new image from already existing image:
```yaml
# docker pull nginx
FROM nginx

# who is creating this
LABEL MAINTAINER=eng130_benedek

# copy index.html
COPY index.html /usr/share/nginx/html/

# docker run -d -p 80:80 name


# port number
EXPOSE 80

#launch the server
CMD ["nginx", "-g", "daemon off;"]
```

build new image: `docker build -t [username]/[image name] .`  
test image by running it: `docker run -d -p [port]:[port] [username]/[image name]`  
push image to docker hub: `docker push [username]/[image name]`

### node app

to create a node app image, follow these steps:

- create `node_app` folder. everything will be inside this folder
- copy `app` and `environment` folders into `node_app` folder
- create `Dockerfile`:
```yaml
FROM nginx
LABEL MAINTAINER=eng130_benedek
COPY app /home/
COPY environment /home/
EXPOSE 80
EXPOSE 3000
RUN apt-get update
RUN apt-get install -y
RUN apt-get install software-properties-common -y
RUN apt-get install npm -y
CMD ["nginx", "-g", "daemon off;"]
WORKDIR /home/app
RUN npm install
CMD ["npm", "start"]
```
- build image: `docker build -t benedek4000/eng130-benedek-node-app .`
- run image to test it: `docker run -d -p 80:3000 benedek4000/eng130-benedek-node-app`
- push image to docker hub: `docker push benedek4000/eng130-benedek-node-app`