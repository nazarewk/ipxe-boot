FROM alpine:latest

RUN apk add --no-cache build-base binutils perl xz-dev mtools git
RUN git clone git://git.ipxe.org/ipxe.git /ipxe
CMD make
WORKDIR /ipxe/src
VOLUME /ipxe/src/bin

