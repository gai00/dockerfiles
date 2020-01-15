#!/bin/bash
nginx -g "daemon on;"

mkfifo -m 644 /tmp/goaccess.fifo

tail -f /tmp/goaccess.fifo \
| goaccess --log-format "$GOACCESS_LOGFORMAT" $GOACCESS_ARGS \
--ws-url $GOACCESS_WSURL/ws \
-o /usr/share/nginx/html/index.html \
--real-time-html &

curl -s --unix-socket /var/run/docker.sock \
"http://v1.40/$GOACCESS_TARGET/logs?stdout=1" \
--output - \
| cut -b 9- > /tmp/goaccess.fifo

while :
do
curl -s --unix-socket /var/run/docker.sock \
"http://v1.40/$GOACCESS_TARGET/logs?stdout=1&tail=0&follow=1" \
 -m 30 --output - \
| cut -b 9- > /tmp/goaccess.fifo
done
