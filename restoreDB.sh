cat backups/redmine.sql | docker exec -i redmine_db /usr/bin/mysql -u root --password=redmine redmine