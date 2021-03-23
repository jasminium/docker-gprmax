# Dockerfile for gprMax

Run gprMax in a Docker container.

## Why?

* Straight forward installation.
* Ideal for deployments to containerised web services like Amazon ECS.

## Installation

First, install [Docker](https://docs.docker.com/get-docker/)

Next we build an image from the Dockerfile. We will run this image later to run our model:
```
sudo docker build --tag docker-gprmax .
```

## Running a model

To run a model, we run the image in a Docker container. This process effectively runs the model `model.in` and saves the usual gprMax model outputs, geometry files etc.. to this directory.

We run the model using:

```bash
sudo docker run \
  --mount type=bind,source="$(pwd)",target=/app \
  docker-gprmax
```

Our directory now contains the `model.in` outputs:

```
.
├── Dockerfile
├── README.md
├── cylinder_half_space.vti
├── model.in
├── model.out
└── requirements.txt
```
To run different models, simply edit the `model.in` file, and re-run.