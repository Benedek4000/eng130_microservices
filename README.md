# Microservices

Microservice architecture is a pattern, in which applications are arranged 
loosely, communicating using lightweight protocols.

## Containerisation

Containers let the user deploy several applications on the same machine. 
The shared parts of the machine are read-only.

## Docker

Docker is a product, which lets the user deploy software products using 
containers, on the same machine.

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