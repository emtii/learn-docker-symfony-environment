# learn-docker-dev-environment

## here we provide a LEMP stack
* Linux
* PHP7
* Nginx
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
* containers are built out of images (official ones or custom ones)
* we use a very basic official image: alpine (edge) for all our container