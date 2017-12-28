FROM alpine:latest
RUN apk add --no-cache dhcp
RUN touch /var/lib/dhcp/dhcpd.leases
ENTRYPOINT ["/usr/sbin/dhcpd", "-f"]
