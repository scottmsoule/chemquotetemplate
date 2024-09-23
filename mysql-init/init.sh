#!/bin/bash
set -e

# Load environment variables from the .env file
export $(cat .env | xargs)

# Create the SQL commands
cat <<EOF > /docker-entrypoint-initdb.d/init.sql
CREATE DATABASE IF NOT EXISTS ${DB_NAME};

CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;

CREATE USER '${PMA_USER}'@'%' IDENTIFIED BY '${PMA_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${PMA_USER}'@'%';
FLUSH PRIVILEGES;
EOF
