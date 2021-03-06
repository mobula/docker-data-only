Docker persistent data container
================================

Based on [Tom Offermann's](https://github.com/toffer/docker-data-only-container-demo)...


Installation
------------
1. Build the image:

```
$ docker build -t mobula/data github.com/mobula/docker-data-only
```

2. Create the container:

```
$ docker run --name myapp_static mobula/data true
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
$ docker run -d -volumes-from <my-app>-data -p 8080:8080 http-server /data/html
```


Dokku
-----
The problem with Dokku is that it removes any stopped (or unused/unlinked?) containers, 
so it may inadvertently delete our volume container should the client application be deleted.
To be continued...

Such a container may be used fo nginx to serve project's static or media assets.

See
---
* http://www.offermann.us/2013/12/tiny-docker-pieces-loosely-joined.html
* http://crosbymichael.com/advanced-docker-volumes.html
* http://docs.docker.com/userguide/dockervolumes/
* http://www.tech-d.net/2013/12/16/persistent-volumes-with-docker-container-as-volume-pattern/
* http://stackoverflow.com/questions/18496940/how-to-deal-with-persistent-storage-e-g-databases-in-docker
* http://docs.docker.com/userguide/dockerlinks

