FROM php:7.2-fpm

# fork from phalconphp/php-fpm:7.2-min

ENV SWOOLE_VERSION=4.0.1
#add docker-machine
ENV DOCKER_MACHINE_VERSION=0.14.0

RUN apt update \
&& apt install -y git zip \
&& git clone --depth=1 "git://github.com/phalcon/cphalcon.git" \
&& cd cphalcon/build \
&& ./install \
&& cp ../tests/_ci/phalcon.ini $(php-config --configure-options | grep -o "with-config-file-scan-dir=\([^ ]*\)" | awk -F'=' '{print $2}') \
&& cd ../../ \
&& rm -r cphalcon \
&& pecl install swoole-${SWOOLE_VERSION} mongodb\
&& docker-php-ext-enable swoole mongodb \
&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
&& base=https://github.com/docker/machine/releases/download/v${DOCKER_MACHINE_VERSION} \
&& curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine \
&& install /tmp/docker-machine /usr/local/bin/docker-machine \
&& apt clean \
&& rm -rf /var/lib/apt/lists/* \
&& pecl clear-cache
