FROM php:7.2-fpm

RUN apt update \
&& apt install -y git zip \
&& git clone --depth=1 "https://github.com/jbboehr/php-psr.git" \
&& cd php-psr \
&& phpize \
&& ./configure \
&& make \
&& make install \
&& cd .. \
&& rm -r php-psr \
&& docker-php-ext-enable psr \
&& git clone --depth=1 "git://github.com/phalcon/cphalcon.git" \
&& cd cphalcon/build \
&& ./install \
&& cp ../tests/_ci/phalcon.ini $(php-config --configure-options | grep -o "with-config-file-scan-dir=\([^ ]*\)" | awk -F'=' '{print $2}') \
&& cd ../../ \
&& rm -r cphalcon \
&& apt clean \
&& rm -rf /var/lib/apt/lists/*
