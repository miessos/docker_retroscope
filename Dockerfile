FROM debian:jessie

MAINTAINER miessos, https://github.com/miessos

# Keep Debian up to date
RUN apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade && apt-get -y autoremove

