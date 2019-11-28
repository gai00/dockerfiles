FROM gai00/dockerfiles:php7.2-phalcon3.4

# pecl yaml

RUN apt update \
&& apt install -y libyaml-dev \
&& pecl install yaml \
&& docker-php-ext-enable yaml \
&& apt clean \
&& rm -rf /var/lib/apt/lists/* \
&& pecl clear-cache
