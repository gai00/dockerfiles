FROM php:8.3.37-fpm-alpine

# 1. 安裝常用工具 (git, curl, bash 等)
RUN apk add --no-cache \
    git \
    curl \
    bash

# 2. 下載擴充套件安裝工具
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# 3. 精確安裝 Phalcon 5.6.2 與專案所需擴充套件 (相容舊版 php8.3-phalcon5.6)
RUN install-php-extensions \
    phalcon-5.6.2 \
    opcache \
    mongodb-1.18.0 \
    memcached-3.2.0 \
    solr-2.7.0 \
    imagick \
    gd \
    exif \
    zip \
    mysqli \
    pdo_mysql \
    gmp \
    bcmath \
    @composer

# 4. 驗證 PHP 版本與關鍵擴充套件皆正常載入
RUN php -v && php -m | grep -E "phalcon|mongodb|imagick|solr|memcached|mysqli"

