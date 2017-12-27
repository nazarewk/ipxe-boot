#!/usr/bin/env sh
cd $(readlink -f $(dirname $0))
docker build --rm -t ipxe-build .
docker run --rm -v "bin:/ipxe/src/bin" ipxe-build make "$@"
