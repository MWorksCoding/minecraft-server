# Minecraft Server running in Docker

A Docker-powered Minecraft server environment built manually rather than using ready-made Minecraft containers.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Quickstart](#-quickstart)
3. [Usage](#-usage)
   - [Checking Server Status](#checking-server-status)
   - [Create a Docker Container](#-create-a-docker-container)
   - [Docker Management Commands](#docker-compose-commands)
4. [Project Checklist](#project-checklist)

## Prerequisites

Before you begin, ensure that the following are installed and set up on your local machine or server:
- [Docker](https://docs.docker.com/get-docker/)

Info: Docker Compose is automatically included in Docker Desktop and Docker Engine.

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

Navigate to the root project directory you just cloned.

Download your Minecraft Server from https://www.minecraft.net/de-de/download/server: https://piston-data.mojang.com/v1/objects/95495a7f485eedd84ce928cef5e223b757d2f764/server.jar

Copy your downloaded .jar file into your root directory of your project.

From here, you can build the Docker container and start the server with Docker Compose:
```
docker compose build --no-cache
```

```
docker compose up
```

You can instantly see the Minecraft server logs with:
```
docker logs -f minecraft-server
```

In case of errors, you can remove the containers and rebuild from scratch:
```
docker compose down
```

Please check the list of typical Docker commands in the section [Docker Management Commands](#docker-compose-commands)

## 🧑‍💻 Usage

### Checking Server Status

To check the server status, use a Python script leveraging the mcstatus library: https://github.com/py-mine/mcstatus

First, create a virtual environment:
```
python -m venv venv
```

Activate your venv on Mac / Linux:
```
source venv/bin/activate
```

Activate your venv on Windows:
```
.\venv\Scripts\activate
```

Inside your project root directory, create a .env file with your environment variables.

Add your configuration variables, check [example.env](./example.env).
You can copy and paste the content, but please keep in mind that the values ​​should only be used for local development for security reasons.

Docker Compose automatically loads .env files, so you don’t need to reference it manually.

Install dependencies:
```
pip install -r requirements.txt
```

Now the mcstatus library is installed.

To get the current server status, run this: 
```
python minecraft_server_status
```

The [minecraft_server_status script.py](./minecraft_server_status.py) acts as a client that connects to the server's port. It then queries the server to retrieve its current status.

### 🐳 Create a Docker Container

General Informations:

To containerize a project, we need to create a file named [Dockerfile](./Dockerfile).
To reduce image size and improve build performance, we need to create a [.dockerignore](./.dockerignore) file.
That [docker-compose.yml](./docker-compose.yaml) file tells Docker exactly how to build, run, configure, and manage your project — all in one place.

In our case all required files already exist. There is nothing to do here.

### Docker Compose Commands

| Command | Description |
|--------|-------------|
| `docker compose build` | Build the Docker image according to your Dockerfile. |
| `docker compose build --no-cache` | Build from scratch without using cached layers. |
| `docker compose up` | Start the container in the foreground (logs visible). |
| `docker compose up -d` | Start the container in detached/background mode. |
| `docker compose up --build` | Build and start containers at the same time. |
| `docker compose up --build -d` | Build and start containers in detached mode. |
| `docker compose stop` | Stop running containers without removing them. |
| `docker compose restart` | Restart all running services. |
| `docker compose down` | Stop and remove containers, networks, and volumes. |
| `docker compose logs -f` | Follow logs in real time. |
| `docker compose logs` | Show logs without following. |
| `docker exec -it minecraft-server /bin/sh` | Open an interactive shell inside the running container. |
| `docker compose ps` | List running containers. |

## Project Checklist

You can find a detailed checklist for this project in PDF format:

- [Download the Checklist](../minecraft-server/docs/checklist.pdf)
