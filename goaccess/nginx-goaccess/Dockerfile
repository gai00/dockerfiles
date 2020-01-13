FROM nginx AS builds
RUN apt update \
&& apt install -y wget g++ libncursesw5-dev libgeoip-dev make geoip-database libtokyocabinet-dev zlib1g-dev libbz2-dev \
&& cd /tmp \
&& wget https://github.com/stockrt/nginx2goaccess/raw/master/nginx2goaccess.sh \
&& chmod +x nginx2goaccess.sh \
&& wget https://tar.goaccess.io/goaccess-1.3.tar.gz \
&& tar zxvf goaccess-1.3.tar.gz \
&& cd goaccess-1.3/ \
&& ./configure --enable-utf8 --enable-geoip=legacy --enable-tcb=btree \
&& make && make DESTDIR=/dist install 

FROM nginx

RUN apt update \
&& apt install -y curl libtokyocabinet-dev \
&& apt clean \
&& rm -rf /var/lib/apt/lists/*

COPY --from=builds /tmp/nginx2goaccess.sh /usr/local/bin/nginx2goaccess
COPY --from=builds /dist /
COPY --from=builds /usr/share/GeoIP /usr/share/GeoIP
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/conf.d/ /etc/nginx/conf.d/
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 80
ENV GOACCESS_LOGFORMAT=COMBINED
CMD ["/entrypoint.sh"]
