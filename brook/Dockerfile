FROM ubuntu:latest

ENV BROOK_VERSION=v20180909

RUN apt update && apt install -y curl \
  && mkdir /app \
  && cd /app \
  && curl -L -O https://github.com/txthinking/brook/releases/download/${BROOK_VERSION}/brook \
  && chmod +x brook

WORKDIR /app
ENTRYPOINT ["./brook"]
