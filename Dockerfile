# ===============================
# 1. Base image OpenJDK
# ===============================
FROM eclipse-temurin:21-jdk

# ===============================
# 2. Directory where Minecraft server will store world, configs, logs
# ===============================
WORKDIR /minecraft

# ===============================
# 3. Copy the server jar into the working directory
# ===============================
COPY server.jar /minecraft/server.jar

# ===============================
# 4. Automatically accept the EULA
# ===============================
ENV EULA=true

# ===============================
# 5. Setting memory env variables
# ===============================
ENV MAX_MEMORY=2G
ENV MIN_MEMORY=1G

# ===============================
# 6. Expose port
# ===============================
EXPOSE 25565

# ===============================
# 7. Runs Minecraft Server
# ===============================
CMD ["sh", "-c", "echo eula=$EULA > eula.txt && java -Xmx${MAX_MEMORY:-2G} -Xms${MIN_MEMORY:-1G} -jar server.jar nogui"]