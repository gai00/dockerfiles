FROM php:8.3-fpm-bullseye

# 1. 調整 Bullseye 倉庫來源為 archive.debian.org 並安裝編譯所需套件
RUN sed -i "s/deb.debian.org/archive.debian.org/g" /etc/apt/sources.list \
    && sed -i "/bullseye-updates/d" /etc/apt/sources.list \
    && apt-get update -o Acquire::Check-Valid-Until=false \
    && apt-get install -y --no-install-recommends -o Acquire::Check-Valid-Until=false \
        git \
        curl \
        xz-utils \
        build-essential \
        autoconf \
        bison \
        re2c \
        pkg-config \
        libxml2-dev \
        libsqlite3-dev \
        libssl-dev \
        libcurl4-openssl-dev \
        libonig-dev \
        libargon2-dev \
        libsodium-dev \
        zlib1g-dev \
        libreadline-dev

# 2. 下載並編譯 PHP 8.3.36 原始碼 (含 php2shell 資安修補)
ENV PHP_VERSION=8.3.36
RUN curl -fsSL "https://www.php.net/distributions/php-${PHP_VERSION}.tar.xz" -o /tmp/php.tar.xz \
    && mkdir -p /tmp/php \
    && tar -xf /tmp/php.tar.xz -C /tmp/php --strip-components=1 \
    && cd /tmp/php \
    && eval "./configure $(php-config --configure-options)" \
    && make -j"$(nproc)" \
    && make install \
    && cd / \
    && rm -rf /tmp/php /tmp/php.tar.xz

# 3. 驗證 PHP 核心版本已升級至 8.3.36
RUN php -v | grep -q "PHP 8.3.36"

# 4. 安裝擴充套件安裝工具
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# 5. 精確安裝 Phalcon 5.6.2 與專案所需擴充套件
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

# 6. 清理 apt 快取
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# 7. 驗證關鍵擴充套件皆正常載入
RUN php -v && php -m | grep -E "phalcon|mongodb|imagick|solr|memcached|mysqli"
