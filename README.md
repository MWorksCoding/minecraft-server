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

Install dependencies:
```
pip install -r requirements.txt
```

Now the mcstatus library is installed.

To get the current server status, run this: 
```
python minecraft_server_status
```

The [minecraft_server_status script](./minecraft_server_status) acts as a client that connects to the server's port. It then queries the server to retrieve its current status.

### 🐳 Create a Docker Container

To containerize your project, create a file named [Dockerfile](./Dockerfile)
To reduce image size and improve build performance, create a [.dockerignore](./.dockerignore) file.

### Docker Compose Commands

Build the Docker image according to your Dockerfile.
```
docker compose build
```

Build with no cache (forces a full rebuild).
```
docker compose build --no-cache
```

Starts the container in the foreground (logs will appear in terminal)
```
docker compose up
```

Start the server in detached mode (runs in the background)
```
docker compose up -d
```

Build and start at the same time
```
docker compose up --build
```

Build and start in detached mode
```
docker compose up --build -d
```

Stops the running container(s) without removing them
```
docker compose stop
```

Restart container(s) that are already running
```
docker compose restart
```

Stop and remove containers, networks, and default volumes for a full cleanup or resetting the environment
```
docker compose down
```

View server logs, follow logs in real time
```
docker compose logs -f
```

Show logs without following
```
docker compose logs
```

Enter the container, open an interactive shell inside the running container
```
docker exec -it minecraft-server /bin/sh
```

Check running containers
```
docker compose ps
```

## Project Checklist

You can find a detailed checklist for this project in PDF format:

- [Download the Checklist](../minecraft-server/docs/checklist.pdf)
