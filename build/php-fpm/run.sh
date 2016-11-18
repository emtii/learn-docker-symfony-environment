#!/bin/sh
PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

print_error () {
  >&2 /bin/echo -e "\033[0;31m"$@"\033[0m"
}

if [ ! -f /var/www/html/shopware.php ]; then
  print_error 'It seems like you did not mount a valid shopware directory, please check that first!'
  exit 10
fi

cd /var/www/html

if [ ! -f  composer.json ]; then
  print_error 'No composer.json found, aborting!'
  exit 20
fi

composer -n install
EXIT_CODE=$?
if [ "0" != "$EXIT_CODE" ]; then
  print_error 'Failed to install dependencies due to previous errors. Error code was:' $EXIT_CODE
  exit 30
fi

if [ -d recovery/common ] && [ -f recovery/common/composer.json ]; then
  cd recovery/common
  composer -n install
  EXIT_CODE=$?
  if [ "0" != "$EXIT_CODE" ]; then
    print_error 'Failed to install dependencies in recovery path due to previous errors. Error code was:' $EXIT_CODE
    exit 40
  fi
  cd ../..
fi

if [ ! -f config.php ]; then
  touch config.php
fi

chmod -R 0777 .

php-fpm
