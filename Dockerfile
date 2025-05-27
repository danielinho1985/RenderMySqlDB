# Use official MySQL image (latest version)
FROM mysql:8.0

# Set root password (change this in production!)
ENV MYSQL_ROOT_PASSWORD=my-secret-pw

# Create a database on startup (optional)
ENV MYSQL_DATABASE=my_app_db
ENV MYSQL_USER=app_user
ENV MYSQL_PASSWORD=app_password

# Expose MySQL port
EXPOSE 3306

# (Optional) Copy custom SQL scripts to initialize the DB
# COPY ./init-scripts/ /docker-entrypoint-initdb.d/
