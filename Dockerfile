FROM    32bit/ubuntu:14.04
MAINTAINER Kasper Janssens

RUN apt-get update -q && apt-get install -y \
    git \
    g++ \
    bison \
    make \
    flex \
    libx11-6 \
    libx11-dev \
    xorg-dev \
    && apt-get clean

RUN useradd developer -d /home/developer -m -s /bin/bash && \
    echo developer:developer | chpasswd && \
    usermod -a -G sudo developer

RUN su - developer -c "\
  git clone git://source.winehq.org/git/wine.git \
"

RUN su - developer -c "\
  cd wine && ./configure && make depend && make \
"
