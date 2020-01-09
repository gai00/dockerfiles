FROM nginx AS builds
RUN apt update \
&& apt install -y wget g++ libncursesw5-dev libgeoip-dev make geoip-database \
&& cd /tmp \
&& wget https://tar.goaccess.io/goaccess-1.3.tar.gz \
&& tar zxvf goaccess-1.3.tar.gz \
&& cd goaccess-1.3/ \
&& ./configure --enable-utf8 --enable-geoip=legacy \
&& make && make DESTDIR=/dist install 

FROM nginx

RUN apt update \
&& apt install -y curl \
&& apt clean \
&& rm -rf /var/lib/apt/lists/*

COPY --from=builds /dist /
COPY --from=builds /usr/share/GeoIP /usr/share/GeoIP
COPY ./nginx/conf.d/ /etc/nginx/conf.d/
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 80
ENV GOACCESS_LOGFORMAT=COMBINED
CMD ["/entrypoint.sh"]
