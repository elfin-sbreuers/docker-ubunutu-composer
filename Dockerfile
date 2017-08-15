FROM ubuntu:16.04

MAINTAINER Sebastian Breuers version: 1.0

RUN apt-get update &&\
    apt-get install -y php7.0 \
        php-xdebug \
        php7.0-sqlite3 \
        php7.0-mbstring


RUN php -r "copy('http://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

RUN mv //composer.phar /usr/bin/composer
