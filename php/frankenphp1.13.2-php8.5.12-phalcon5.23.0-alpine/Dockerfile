FROM dunglas/frankenphp:1.13.2-php8.5.12-alpine

WORKDIR /var/www/html

# 1. 安裝系統工具 (ffmpeg, git, curl, bash 等)
RUN apk add --no-cache \
    git \
    ffmpeg \
    curl \
    bash

# 2. 安裝最新版 Phalcon 5.23.0 與專案所需擴充套件
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

# 3. 預設 Mercure JWT 金鑰環境變數 (可由 docker-compose.yaml 或 .env 覆蓋)
ENV MERCURE_PUBLISHER_JWT_KEY="!ChangeThisMercureHubJWTSecretKey!" \
    MERCURE_SUBSCRIBER_JWT_KEY="!ChangeThisMercureHubJWTSecretKey!"

# 4. 複製針對 Warehouse / Phalcon 的 Caddyfile
COPY Caddyfile /etc/caddy/Caddyfile

# 4. 驗證擴充套件皆正常載入
RUN php -v && php -m | grep -E "phalcon|mongodb|imagick|solr|memcached"

# 5. 預設啟動 FrankenPHP
CMD ["frankenphp", "run", "--config", "/etc/caddy/Caddyfile"]
