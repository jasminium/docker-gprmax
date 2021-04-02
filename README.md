# Dockerfile for gprMax

Run gprMax in a Docker container.

## Why?

* Install and run gprMax models with a single command.
* Ideal for deployments to containerised web services like Amazon ECS.

## Installation

Install [Docker](https://docs.docker.com/get-docker/)

## Running a model

To run the example gprMax model ```model.in``` given in this directory. Run the following command:

```bash
docker run -v "$PWD":/app jasminium/dockergprmax:latest model.in
```

gprMax will now run inside the container and the output files will be saved in the current directory.

```
.
├── Dockerfile
├── README.md
├── cylinder_half_space.vti
├── model.in
├── model.out
└── requirements.txt
```

The command has 3 actions:

1. Pull the jasminium/dockergprmax image from Docker Hub (if it's the first time the command has been run).
2. Mount the local directory in the Docker container under /app.
3. Run jasminium/dockergprmax image in a container with the specified parameters parameters.

## Additional Parameters
gprMax parameters can be added to the end of above command. For example, the geometry of the simulation can be tested without running gprMax by running

```bash
docker run -v "$PWD":/app jasminium/dockergprmax:latest model.in --geometry-only
```

In this case the only output is the geometry file ```cylinder_half_space.vti```

```
.
├── Dockerfile
├── README.md
├── cylinder_half_space.vti
├── model.in
└── requirements.txt
```

## Rebuild the image

Currently the docker image is pulled from Docker Hub. To rebuild the image run.

```
docker build -t dockergprmax:latest .
```

Run new image:

```bash
docker run -v "$PWD":/app dockergprmax:latest model.in
```