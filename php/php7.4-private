FROM gai00/dockerfiles:php7.4-phalcon4.0

# pecl yaml

RUN apt update \
&& apt install -y libyaml-dev \
&& pecl install yaml \
&& docker-php-ext-enable yaml \
&& apt clean \
&& rm -rf /var/lib/apt/lists/* \
&& pecl clear-cache
