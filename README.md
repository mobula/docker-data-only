Docker persistent data container
================================

Based on Tom Offermann's...


Installation
------------
1. Build the image:

```
$ docker build -t data <path>
```

2. Create the container:

```
$ docker run -name <my-app>-data data true
```

Usage
-----

A regular application `Dockerfile`:

```
FROM ubuntu:trusty
MAINTAINER Me <Me@Me.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list

RUN apt-get update
RUN apt-get -y install ...

<other commands>

ADD entrypoint /entrypoint
RUN chmod 755 /entrypoint

ENTRYPOINT ["/entrypoint"]
CMD ["..."]
```

Run the application in a container (non persistent):
```bash
$ docker run -volumes-from <my-app>-data <my-app> <path>
```

Run another application, daemonized (which will in turn make the volume container persistent)
```bash
$ docker run -d -volumes-from pandoc-data -p 8080:8080 http-server /data/html
```

See
---
* http://www.offermann.us/2013/12/tiny-docker-pieces-loosely-joined.html
* http://crosbymichael.com/advanced-docker-volumes.html
* http://docs.docker.com/userguide/dockervolumes/
* http://www.tech-d.net/2013/12/16/persistent-volumes-with-docker-container-as-volume-pattern/
* http://stackoverflow.com/questions/18496940/how-to-deal-with-persistent-storage-e-g-databases-in-docker
* http://docs.docker.com/userguide/dockerlinks

