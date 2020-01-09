#!/bin/bash
nginx -g "daemon on;"
curl -s --unix-socket /var/run/docker.sock \
"http://v1.40/$GOACCESS_TARGET/logs?stdout=true&follow=1" \
--output - \
| cut -b 9- \
| goaccess --log-format "$GOACCESS_LOGFORMAT" $GOACCESS_ARGS \
--ws-url $GOACCESS_WSURL/ws \
-o /usr/share/nginx/html/index.html \
--real-time-html \
| tail -f
