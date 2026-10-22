FROM php:8.3.36-fpm-bookworm

# 安裝常用系統工具 (包含舊版既有的 git)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# 精確鎖定原 php8.3-phalcon5.6 的擴充套件版本，僅升級 PHP 核心
RUN install-php-extensions \
    phalcon-5.6.2 \
    mongodb-1.18.0 \
    memcached-3.2.0 \
    solr-2.7.0 \
    imagick \
    gd \
    exif \
    zip \
    mysqli \
    gmp \
    bcmath \
    @composer

RUN php -m | grep -E "phalcon|mongodb|imagick|solr|memcached|mysqli"
