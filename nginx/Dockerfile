FROM alpine:latest
RUN apk add --no-cache nginx
RUN mkdir -p /run/nginx
COPY default.conf /etc/nginx/conf.d/default.conf
ENTRYPOINT ["nginx", "-g", "daemon off;"]