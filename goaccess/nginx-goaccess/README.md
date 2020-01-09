# nginx-goaccess

first think about name, I want to call `dogoaccess` LOL  
maybe next time.

## info
This image is build for docker user,  
you have to bind `/var/run/docker.sock`,
and set environment `GOACCESS_TARGET` and `GOACCES_WSURL`.

## example
```yaml
version: "3.7"

services:
  goaccess:
    image: test:nginx-goaccess
    # entrypoint: ["bash"]
    ports:
      - 8080:80
    tty: true
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      # x-forwarded-for
      # - "GOACCESS_LOGFORMAT=%^ %^[%d:%t %^] \"%r\" %s %b \"%R\" \"%u\" \"%h,|\" \"%T\""
      # - "GOACCESS_ARGS=--time-format %T --date-format %d/%b/%Y"
      - GOACCESS_TARGET=services/dev-markdown_nginx
      - GOACCESS_WSURL=ws://localhost:8080
    deploy:
      placement:
        constraints:
          - node.role == manager
```

## environments
|environment_name|format|
|----------------|------|
|GOACCESS_TARGET |this will transform to part of api url to request <br />ex: `service/mystack_serviceName` or `container/nginx` |
|GOACCESS_WSURL  |same as goaccess `--ws-url` but extend tail `/ws` <br /> ex: `ws://localhost:8080`|

## notice
this image not tested enough, becareful to use, be free to modify by your self.
