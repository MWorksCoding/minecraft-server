# Minecraft Server running in Docker

A Docker-powered Minecraft server environment built manually rather than using ready-made Minecraft containers.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Quickstart](#quickstart)
3. [Usage](#-usage)
   - [Create a Docker Container](#-create-a-docker-container)
   - [Docker Management Commands](#-docker-management-commands)
4. [Project Checklist](#project-checklist)

## Prerequisites

Before you begin, ensure that the following are installed and set up on your local machine or server:
- [Docker](https://docs.docker.com/get-docker/)

## 🚀 Quickstart

Clone this repository and follow the setup instructions below to get the application running.

Open your command line and type the following commands:
With SSH configured (if SSH Keys are provided to GitHub)
```
git clone git@github.com:MWorksCoding/minecraft-server.git
```
Classic HTTPS (if no SSH Keys are provided to GitHub)
```
git clone https://github.com/MWorksCoding/minecraft-server.git
```
Download your Minecraft Server from https://www.minecraft.net/de-de/download/server: https://piston-data.mojang.com/v1/objects/95495a7f485eedd84ce928cef5e223b757d2f764/server.jar

Copy your downloaded .jar file into your root directory of your project.

From here you can start the Building with Docker Compose:

```
docker compose up --build 
```

## 🧑‍💻 Usage

### 🐳 Create a Docker Container

To containerize your project, create a file named [Dockerfile](./Dockerfile)

To reduce image size and improve build performance, create a [.dockerignore](./.dockerignore) file.

### 🧭 Docker Management Commands

List all images you’ve built or pulled
```
docker image ls
```

Remove specific images
```
docker rmi <docker_image_id>
```

See running containers:
```
docker ps
```

Stop running container:
```
docker stop <docker_container_id>
```

## Project Checklist

You can find a detailed checklist for this project in PDF format:

- [Download the Checklist](../minecraft-server/docs/checklist.pdf)
