FROM php:7.4-fpm

RUN cd ~ \
&& apt update \
&& apt install -y python3 python3-pip git libzmq3-dev \
&& python3 -m pip install jupyterhub \
&& curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash \
&& . ~/.bashrc \
&& nvm install stable \
&& npm i -g configurable-http-proxy \
&& python3 -m pip install notebook \
&& git clone --depth=1 git://github.com/mkoppanen/php-zmq.git \
&& cd php-zmq \
&& phpize && ./configure \
&& make && make install \
&& cd .. \
&& rm -fr php-zmq \
&& docker-php-ext-enable zmq \
&& curl -O https://litipk.github.io/Jupyter-PHP-Installer/dist/jupyter-php-installer.phar \
&& php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
&& php composer-setup.php --install-dir=/bin --filename=composer \
&& php -r "unlink('composer-setup.php');" \
&& chmod +x jupyter-php-installer.phar \
&& ./jupyter-php-installer.phar install \
&& rm ./jupyter-php-installer.phar \
&& apt clean \
&& rm -rf /var/lib/apt/lists/*
