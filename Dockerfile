FROM ubuntu:20.04
LABEL Description="Docker image for NS-3 Network Simulator"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
# General dependencies
RUN apt-get install -y \
  git \
  mercurial \
  wget \
  vim \
  nano \
  autoconf \
  bzr \
  cvs \
  unrar \
  build-essential \
  clang \
  valgrind \
  gsl-bin \
  libgsl-dev \
  libgslcblas0 \
  flex \
  bison \
  libfl-dev \
  tcpdump \
  tshark \
  sqlite3 \
  libsqlite3-dev \
  libxml2 \
  libxml2-dev \
  vtun \
  lxc
# QT4 components
RUN apt-get install -y \
  qtbase5-dev
# Python components
RUN apt-get install -y \
  python3 \
  python3-dev \
  python3-setuptools \
  cmake \
  libc6-dev \
  libc6-dev-i386 \
  g++-multilib
# Create python symlink for compatibility
RUN ln -s /usr/bin/python3 /usr/bin/python
# NS-3
# Create working directory
RUN mkdir -p /usr/ns3
WORKDIR /usr
# Fetch NS-3 source
RUN wget http://www.nsnam.org/release/ns-allinone-3.29.tar.bz2
RUN tar -xf ns-allinone-3.29.tar.bz2
# Configure and compile NS-3
RUN cd ns-allinone-3.29 && python3 ./build.py --enable-examples --enable-tests
RUN ln -s /usr/ns-allinone-3.29/ns-3.29/ /usr/ns3/
# Cleanup
RUN apt-get clean && \
  rm -rf /var/lib/apt && \
  rm /usr/ns-allinone-3.29.tar.bz2
