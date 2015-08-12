# OSDF-Deb-Docker

A docker container to generate the deb package for OSDF

## Instructions for use

First build the container. This will take some time (depending on the speed of
your internet connnection) as there are numerous packages that will downloaded
and installed.:

  $ docker build -t osdf_deb_build .

Then run the container and provide a volume to the container that it will use
as "/export". In this example, we are providing the host's /tmp directory to
the container.

  $ docker run -v /tmp:/export osdf_deb_build

After the process completes, there should be a .tar.gz as well as a .deb file
in the directory that was used for the volume (/tmp in this example).
