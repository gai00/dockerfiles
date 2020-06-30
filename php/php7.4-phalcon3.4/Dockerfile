FROM php:7.4-fpm

RUN apt update \
&& apt install -y git zip \
&& git clone --depth=1 --branch 3.4.x --single-branch "git://github.com/phalcon/cphalcon.git" \
&& cd cphalcon/build \
&& ./install \
&& cp ../tests/_ci/phalcon.ini $(php-config --configure-options | grep -o "with-config-file-scan-dir=\([^ ]*\)" | awk -F'=' '{print $2}') \
&& cd ../../ \
&& rm -r cphalcon \
&& apt clean \
&& rm -rf /var/lib/apt/lists/*
