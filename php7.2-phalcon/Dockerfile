FROM php:7.2-fpm

# fork from phalconphp/php-fpm:7.2-min

RUN apt update \
&& apt install -y git \
&& git clone --depth=1 "git://github.com/phalcon/cphalcon.git" \
&& cd cphalcon/build \
&& ./install \
&& cp ../tests/_ci/phalcon.ini $(php-config --configure-options | grep -o "with-config-file-scan-dir=\([^ ]*\)" | awk -F'=' '{print $2}') \
&& cd ../../ \
&& rm -r cphalcon \
&& pecl install swoole-2.1.1 mongodb\
&& docker-php-ext-enable swoole mongodb \
&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
