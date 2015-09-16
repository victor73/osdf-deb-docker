# The Basics
FROM ubuntu:trusty
MAINTAINER Victor Felix <victor73@github.com>

RUN mkdir /build

# Create the OSDF user
RUN /usr/sbin/groupadd osdf
RUN /usr/sbin/useradd --home-dir /export/osdf -g osdf --shell /bin/bash osdf

RUN chown -R osdf.osdf /build

RUN apt-get update
RUN apt-get install -y software-properties-common git dh-make build-essential devscripts fakeroot debootstrap pbuilder subversion openjdk-7-jre ant

USER osdf

CMD git clone http://github.com/IGS/OSDF /build/osdf && cd /build/osdf && git pull && /usr/bin/ant clean deb && cp dist/* /export/
