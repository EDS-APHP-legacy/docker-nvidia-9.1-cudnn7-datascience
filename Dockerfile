FROM nvidia/cuda:9.1-cudnn7-devel-ubuntu16.04

# Install base tools
RUN http_proxy=$http_proxy apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
	pkg-config \
	dh-autoreconf \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install build & doc tools
RUN http_proxy=$http_proxy apt-get update && apt-get install -y --no-install-recommends \
  cmake \
	doxygen \
	dh-autoreconf \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Install basic cli tools
RUN http_proxy=$http_proxy apt-get update && apt-get install -y --no-install-recommends \
  htop \
  mlocate \
  tree \
  most \
  net-tools \
  vim \
  unzip \
  git \
  wget \
	dh-autoreconf \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Install libs
RUN http_proxy=$http_proxy apt-get update && apt-get install -y --no-install-recommends \
  libboost-all-dev \
  libgflags-dev \
  libgoogle-glog-dev \
  libhdf5-serial-dev \
  libleveldb-dev \
  liblmdb-dev \
  libprotobuf-dev \
  libsnappy-dev \
	libavcodec-dev \
	libavformat-dev \
	libswscale-dev \
	libtbb2 \
	libtbb-dev \
	libjpeg-dev \
	libpng-dev \
	libtiff-dev \
	libdc1394-22-dev \
	libxine2-dev \
	zlib1g-dev \
	libvorbis-dev \
	libxvidcore-dev \
	libv4l-dev \
	v4l-utils \
	libgdal-dev \
	libeigen3-dev \
	libcurl3-dev \
	x264 \
	x265 \
        protobuf-compiler \
	swig \
	rsync \
	dh-autoreconf \
        python3-dev libsasl2-dev libsasl2-2 libsasl2-modules-gssapi-mit \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ENV DEBIAN_FRONTEND=noninteractive
RUN http_proxy=$http_proxy apt-get update && apt-get install -y --no-install-recommends \
    krb5-user \
    libpam-ccreds \
    libpam-krb5 \
    libkrb5-dev \
    libpam-ldap \
    sudo \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

