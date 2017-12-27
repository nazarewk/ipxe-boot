ipxe boot using docker

# Building ipxe
    
    cd ipxe-build
    docker build --rm -t ipxe-build ipxe-build
    docker run --rm -v "$(readlink -f ipxe-build/bin):/ipxe/src/bin" ipxe-build make bin/undionly.kpxe
    
or simply

    ipxe-build/build.sh bin/undionly.kpxe