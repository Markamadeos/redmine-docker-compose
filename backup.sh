#!/bin/sh

#cd=/backups
echo "[INFO] Start backup..."
docker run --rm --network redmine-docker-compose_redmine -it mariadb:10.6 mysqldump --host mariadb --user=root --password=redmine --opt redmine > ./backups/redmine.sql

tar -czf backups/redmine.tar.gz --exclude="db/*" data/redmine
echo "[INFO] Finish backup..."