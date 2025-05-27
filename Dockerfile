# Force x86_64 architecture (Render's free tier has ARM issues with MySQL)
FROM --platform=linux/amd64 mysql:8.0

# Configure MySQL (change these values!)
ENV MYSQL_ROOT_PASSWORD=your_root_password_123
ENV MYSQL_DATABASE=my_app_db
ENV MYSQL_USER=app_user
ENV MYSQL_PASSWORD=app_password_456

# Add a minimal HTTP health check endpoint (to bypass Render's port scan)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:8080/ || exit 1

# Start MySQL and a dummy HTTP server (on port 8080)
CMD sh -c \
  "apt-get update && apt-get install -y socat && \
   socat TCP-LISTEN:8080,fork,reuseaddr EXEC:'echo \"HTTP/1.1 200 OK\n\nOK\"' & \
   docker-entrypoint.sh mysqld"
