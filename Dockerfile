FROM stackbrew/busybox:latest
MAINTAINER Tom Offermann <tom@offermann.us>

# Create data directory
RUN mkdir /data

# Create /data volume
VOLUME /data
