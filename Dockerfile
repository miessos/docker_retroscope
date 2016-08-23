FROM ubuntu:latest

MAINTAINER miessos, https://github.com/miessos

# Keep Ubuntu  up to date
RUN apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade && apt-get -y autoremove

# Install dependencies
RUN apt-get install -y openjdk-8-jdk \
    git-core \
    gnupg \
    flex \
    bison \
    gperf \
    build-essential \
    zip \
    curl \
    zlib1g-dev \
    gcc-multilib \
    g++-multilib \
    libc6-dev-i386 \
    lib32ncurses5-dev \
    x11proto-core-dev \
    libx11-dev \
    lib32z-dev \
    ccache \
    libgl1-mesa-dev \
    libxml2-utils \
    xsltproc \
    unzip

# Update the default Java version (optional)
RUN update-alternatives --config java 
RUN update-alternatives --config javac

# Configuring USB Access
RUN wget -S -O - http://source.android.com/source/51-android.rules \
    sed "s/<username>/$USER/" \
    tee >/dev/null /etc/udev/rules.d/51-android.rules \
    udevadm control --reload-rules
