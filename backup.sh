#!/bin/bash

source ".env"

echo "[INFO] Start backup..."
docker run --rm --network ${NETWORK} -it mariadb:${DB_VERSION} mysqldump --host ${DB_HOST} --user=root --password=${DB_SECRET} --opt ${REDMINE_DB} > ./backups/redmine.sql

tar -czf backups/redmine.tar.gz --exclude="db/*" data/redmine
echo "[INFO] Finish backup..."