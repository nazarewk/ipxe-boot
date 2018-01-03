FROM alpine:latest
RUN apk add --no-cache nginx
RUN mkdir -p /run/nginx
COPY default.conf /etc/nginx/conf.d/default.conf
ENTRYPOINT ["nginx", "-g", "daemon off;"]
ADD --chown=nginx:nginx "https://rom-o-matic.eu/build.fcgi?BINARY=undionly.kpxe&BINDIR=bin&REVISION=master&DEBUG=undi%2Cdhcp&EMBED.00script.ipxe=%23%21ipxe%0A%0Aset%20user-class%20iPXE-nazarewk%0A%0A%3Aretry_boot%0Aautoboot%20%7C%7C%20goto%20retry_boot" /srv/built-http/undionly.kpxe