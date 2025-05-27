FROM --platform=linux/amd64 mysql:8.0

# MySQL configuration
ENV MYSQL_ROOT_PASSWORD=your_root_password_123
ENV MYSQL_DATABASE=my_app_db
ENV MYSQL_USER=app_user
ENV MYSQL_PASSWORD=app_password_456

# Simple health check that actually tests MySQL
HEALTHCHECK --interval=30s --timeout=3s \
  CND mysqladmin ping -h localhost -u root -p${MYSQL_ROOT_PASSWORD} || exit 1

# Just start MySQL normally
CMD ["docker-entrypoint.sh", "mysqld"]
