#!/bin/bash

BUILD_TYPE=$1

cd $HOME/build/public_git/oio-sds

debug_build () {
  #export CC=gcc-8
  export APACHE2_INCLUDE_DIRS=/usr/include/apache2
  export APACHE2_LIBRARY_DIRS=/usr/lib/apache2

  cmake \
    -DAPACHE2_LIBRARY_DIRS=/usr/lib/apache2 \
    -DAPACHE2_INCLUDE_DIRS=/usr/include/apache2 \
    -DAPACHE2_MODDIR=/home/fvenneti/devroot/lib/apache2/modules \
    -DCMAKE_INSTALL_PREFIX=/home/fvenneti/devroot \
    -DCMAKE_BUILD_TYPE=Debug \
    -DENABLE_CODECOVERAGE=on \
    -DZK_INCDIR=/home/fvenneti/devroot/include/zookeeper \
    -DZK_LIBDIR=/home/fvenneti/devroot/lib \
    -DPKGCONFIG_DIRECTORY="/home/fvenneti/devroot/lib64/pkgconfig:$(pkg-config --variable pc_path pkg-config)" \
    -DCMAKE_INSTALL_RPATH="/home/fvenneti/devroot/lib" \
    ~/src/public_git/oio-sds
}

release_build () {
  export CC=gcc-8
  export APACHE2_INCLUDE_DIRS=/usr/include/apache2
  export APACHE2_LIBRARY_DIRS=/usr/lib/apache2

  cmake \
    -DAPACHE2_LIBRARY_DIRS=/usr/lib/apache2 \
    -DAPACHE2_INCLUDE_DIRS=/usr/include/apache2 \
    -DAPACHE2_MODDIR=/home/fvenneti/devroot/lib/apache2/modules \
    -DCMAKE_INSTALL_PREFIX=/home/fvenneti/devroot \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_CODECOVERAGE=off \
    -DZK_INCDIR=/home/fvenneti/devroot/include/zookeeper \
    -DZK_LIBDIR=/home/fvenneti/devroot/lib \
    -DPKGCONFIG_DIRECTORY="/home/fvenneti/devroot/lib64/pkgconfig:$(pkg-config --variable pc_path pkg-config)" \
    -DCMAKE_INSTALL_RPATH="/home/fvenneti/devroot/lib" \
    ~/src/public_git/oio-sds
}

case $BUILD_TYPE in
  debug)
    debug_build
    ;;
  release)
    release_build
    ;;
  *)
    echo "Unknown build type $BUILD_TYPE"
    exit 1
    ;;
esac

make -j8 && make install
