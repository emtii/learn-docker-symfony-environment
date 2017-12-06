# learn-docker-dev-environment
This repository represents my steps learning docker. Goal of this is:
 
* to create a local docker dev environment provided by several containers.
* to be able to host this stack on:
  * docker cloud for container orchestration
  * digital ocean as cloud provider

## here we provide a LAMP stack
* Linux (alpine, if possible)
* PHP7 (https://hub.docker.com/_/php/)
* httpd (https://hub.docker.com/_/httpd/)
* MySQL (https://hub.docker.com/_/mysql/)

## best practice
* use docker compose to orchestrate containers
* use only one process per container
* redirect logs to container's standard output, never persist data in container

## this in mind, we separate things as follows:
* a container for httpd
* a container for PHP-FPM
* a container for MySQL
* we bind two volumes for persistent data:
  * app data
  * mysql data

## basic knowledge needed before
* containers are built out of images (official ones or private custom ones)
* we mainly use official images (if possible based on alpine for best speed)
* we use php-fpm for performance (and to learn config as well)
* we understand, that volumes tag syncs host with containers file system e.g. ("." with "/var/www/html")
* data container can persist data volumes for app and database
* data container exit on startup, thats fine, they work as long as they are linked

## todo
* add redis to stack