FROM php:8.5.12-fpm-alpine

# 1. 安裝常用工具 (git, curl, bash 等)
RUN apk add --no-cache \
    git \
    curl \
    bash

# 2. 下載擴充套件安裝工具
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# 3. 安裝 Phalcon 5.23.0 與專案所需擴充套件
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

# 4. 驗證擴充套件皆正常載入
RUN php -v && php -m | grep -E "phalcon|mongodb|imagick|solr|memcached|mysqli"
