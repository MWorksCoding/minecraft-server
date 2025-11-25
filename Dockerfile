# ===============================
# 1. Base image OpenJDK
# ===============================
FROM openjdk:21-jdk-slim

# ===============================
# 2. Set work directory
# ===============================
WORKDIR /app

# ===============================
# 3. Copy directory into app directory
# ===============================
COPY . $WORKDIR

# ===============================
# 4. Automatically accept the EULA
# ===============================
RUN echo "eula=true" > eula.txt

# ===============================
# 5. Copy project files
# ===============================
COPY . /app

# ===============================
# 6. Expose port
# ===============================
EXPOSE 25565

# ===============================
# 9. Runs Minecraft Server
# ===============================
# Runs migrations, then starts Gunicorn server
CMD ["sh", "-c", "java -Xmx1024M -Xms1024M -jar minecraft_server.1.21.10.jar nogui"]