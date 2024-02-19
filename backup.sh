
#!/bin/sh

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <backup folder>";
    exit;
fi

# current dir
cd=${0%/*}

. $cd/.env

docker run --rm --network ${DOCKER_NETWORK} -it mariadb:${MARIADB_VERSION} mysqldump --host ${MYSQL_HOST} --user=root --password=${MYSQL_PWD} --opt ${REDMINE_DB} > /data/redmine/redmine.sql

tar -C / -cz -f $1/redmine.tar.gz --exclude="db/*" data/redmine opt/redmine

echo "[INFO] Finish backup."