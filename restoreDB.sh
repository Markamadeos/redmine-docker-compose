#!/bin/bash

source ".env"

echo "[INFO] Start restore..."
cat backups/redmine.sql | docker exec -i ${DB_CONTAINER_NAME} /usr/bin/mysql -u root --password=${DB_SECRET} ${REDMINE_DB}
echo "[INFO] Finish restore..."