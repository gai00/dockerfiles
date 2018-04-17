FROM ubuntu:latest

# version: v20180401
RUN apt update && apt install -y curl \
  && mkdir /app \
  && cd /app \
  && curl -L -O https://github.com/txthinking/brook/releases/download/v20180401/brook \
  && chmod +x brook

WORKDIR /app
ENTRYPOINT ["./brook"]
