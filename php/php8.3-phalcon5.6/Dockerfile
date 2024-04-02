FROM php:8.3-fpm-bullseye

RUN apt update \
&& apt install -y libpcre3-dev \
&& pecl channel-update pecl.php.net \
&& pecl install phalcon \
&& docker-php-ext-enable phalcon \
&& pecl install mongodb \
&& docker-php-ext-enable mongodb \
&& apt install -y libmemcached-dev zlib1g-dev \
&& pecl install memcached \
&& docker-php-ext-enable memcached \
&& apt install -y git libmagickwand-dev libxml2-dev libcurl4-gnutls-dev zlib1g-dev libmemcached-dev libpng-dev libjpeg-dev libfreetype6-dev libonig-dev libzip-dev libgmp-dev \
&& git clone https://github.com/Imagick/imagick.git --depth=1 /tmp/imagick \
&& cd /tmp/imagick \
&& phpize \
&& ./configure \
&& make \
&& make install \
&& docker-php-ext-enable imagick \
&& cd /tmp \
&& rm -rf /tmp/imagick \
&& docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
&& docker-php-ext-install gd exif zip mysqli gmp bcmath \
&& docker-php-ext-enable gd exif zip mysqli gmp bcmath \
&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
&& apt install -y libcurl4-gnutls-dev libxml2-dev \
&& pecl install solr \
&& docker-php-ext-enable solr \
&& apt clean \
&& rm -rf /var/lib/apt/lists/* \
&& pecl clear-cache
