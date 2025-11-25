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
# 6. Expose port
# ===============================
EXPOSE 25565

# ===============================
# 9. Runs Minecraft Server
# ===============================
CMD ["sh", "-c", "echo eula=$EULA > eula.txt && java -Xmx2G -Xms1G -jar server.jar nogui"]