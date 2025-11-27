# ==============================================
# Minecraft Server Status Checker
# ==============================================
# This script connects to a Minecraft Java Edition server using the 'mcstatus' library.
# It retrieves basic server information such as online players, latency (ping), and optionally
# a full player list via the Query protocol.
#
# Requirements:
# - Python 3.x
# - mcstatus library (install with `pip install mcstatus`)
# - Minecraft server running and accessible at the given host/port
#
# Note:
# - `status()` and `ping()` always work on vanilla servers.
# - `query()` requires 'enable-query=true' in the server.properties file.
# ==============================================

from mcstatus import JavaServer  # Import the JavaServer class from mcstatus

# ------------------------------
# 1. Connect to the server
# ------------------------------
# The host and port should match the Minecraft server you want to monitor.
# Here, '127.0.0.1' is localhost, and '8888' is the port mapped in Docker.
server = JavaServer.lookup("127.0.0.1:8888")

# ------------------------------
# 2. Get basic server status
# ------------------------------
# `status()` provides general information about the server:
# - Number of online players
# - Maximum players
# - Server MOTD
# - Latency (ping)
status = server.status()
print(f"The server has {status.players.online} player(s) online and replied in {status.latency} ms")

# ------------------------------
# 3. Get ping (latency only)
# ------------------------------
# This is similar to status, but returns only the ping in milliseconds.
latency = server.ping()
print(f"The server replied in {latency} ms")

# ------------------------------
# 4. Query the server for detailed information (optional)
# ------------------------------
# `query()` can return the full player list, mod info, etc.
# WARNING: This requires 'enable-query=true' in server.properties.
# If the server does not have query enabled, it will raise a TimeoutError.
try:
    query = server.query()  # Attempt to query the server
    # Access the player list via query.players.names
    print(f"The server has the following players online: {', '.join(query.players.names)}")
except Exception as e:
    # Handle errors gracefully if query is disabled or fails
    print(f"Query failed: {e}")

# ==============================================
# Notes:
# - If you only need online player count and latency, you can use status() and ping()
# - Query is optional and requires server configuration
# - This script can be run from a Python virtual environment
# ==============================================
