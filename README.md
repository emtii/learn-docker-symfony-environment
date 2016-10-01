# learn-docker-dev-environment
This repository represents my steps learning docker. Goal of this is to create a local docker dev environment provided by several containers.

## here we provide a LEMP stack
* Linux
* PHP7 (https://hub.docker.com/_/php/)
* Nginx (https://hub.docker.com/_/nginx/)
* MySQL

## best practice
* use docker compose to orchestrate containers
* use only one process per container

## this in mind, we separate things as follows:
* a container for Nginx
* a container for PHP-FPM
* a container for MySQL
* a container to make MySQL data persistent
* a container for the application code

## basic knowledge needed before
* containers are built out of images (official ones or private custom ones)
* we mainly use official images (if possible based on alpine for best speed)
* we use php-fpm for performance (and to learn config as well)
* we understand, that volumes tag syncs host with containers file system e.g. ("." with "/var/www/html")
* data container can persist data volumes for app and database