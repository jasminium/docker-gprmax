# Dockerfile for gprMax

Run gprMax in a Docker container.

## Why?

* Straight forward installation.
* Ideal for deployments to containerised web services like Amazon ECS.

## Installation

First, install [Docker](https://docs.docker.com/get-docker/)

Next we build the image from the Dockerfile:
```
sudo docker build --tag docker-gprmax .
```
Next we run the image in a container. This effectively runs the gprMax model `model.in`:

```bash
sudo docker run \
  --mount type=bind,source="$(pwd)",target=/app docker-gprmax
```