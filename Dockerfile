# Docker file for data image sharing /data volume
# Based on https://github.com/toffer/docker-data-only-container-demo
# Based on Daniel Mizyrycki's example in contrib/desktop-integration
#
# Usage:
#
#   # Build data image
#   docker build -t data -rm .
#
#   # Create a data container. (eg: pandoc-data)
#   docker run -name pandoc-data data true
#
#   # List data from it
#   docker run -volumes-from pandoc-data busybox ls -al /data

FROM stackbrew/busybox:latest
MAINTAINER Sophie <mobula.diabolus@gmail.com>

# Create data directory
RUN mkdir /data

# Create /data volume
VOLUME /data
