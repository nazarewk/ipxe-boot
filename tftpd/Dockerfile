FROM alpine:latest
RUN apk add --no-cache tftp-hpa
VOLUME /tftproot
ENTRYPOINT ["/usr/sbin/in.tftpd", "-L", "-c", "-s", "/tftproot"]
