FROM alpine:latest
RUN apk add --no-cache tftp-hpa
RUN mkdir -p /data
ENTRYPOINT ["/usr/sbin/in.tftpd", "-L", "-c", "-s", "/data"]
