FROM php:8.5.12-fpm

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN install-php-extensions \
    phalcon-5.23.0 \
    opcache \
    memcached \
    mongodb \
    mysqli \
    pdo_mysql \
    imagick \
    gd \
    exif \
    zip \
    gmp \
    bcmath \
    solr \
    @composer

RUN php -m | grep -E "phalcon|psr|mongodb|imagick|solr|memcached"
