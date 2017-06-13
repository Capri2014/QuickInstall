#!/bin/bash
set -e

## GCC
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install g++-4.9-multilib gfortran-4.9 gfortran


## Clang 3.9
sudo apt-get install --no-install-recommends lsb-core software-properties-common wget
wget -q -O - http://llvm.org/apt/llvm-snapshot.gpg.key | sudo apt-key add -
sudo add-apt-repository -y "deb http://apt.llvm.org/trusty/ llvm-toolchain-trusty-3.9 main"
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install clang-3.9 gfortran

## CMake
mkdir -p ~/tools
cd ~/tools
wget https://cmake.org/files/v3.5/cmake-3.5.2-Linux-x86_64.tar.gz
tar zxvf cmake-3.5.2-Linux-x86_64.tar.gz
rm cmake-3.5.2-Linux-x86_64.tar.gz
cd cmake-3.5.2-Linux-x86_64/bin
echo "export PATH=`pwd`:\$PATH" >> ~/.bashrc


## JDK8
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

## Bazel
wget https://github.com/bazelbuild/bazel/releases/download/0.4.3/bazel_0.4.3-linux-x86_64.deb
echo "0cd6592ac2c5548d566fa9f874a386737e76029f5aabe1f04f8320173a05280d  bazel_0.4.3-linux-x86_64.deb" > bazel_0.4.3-linux-x86_64.deb.sha256
sha256sum --check bazel_0.4.3-linux-x86_64.deb.sha256 && sudo dpkg -i bazel_0.4.3-linux-x86_64.deb

## Other common
udo apt-get update
sudo apt-get install --no-install-recommends \
          autoconf automake bison doxygen freeglut3-dev git graphviz \
            libboost-dev libboost-system-dev libgtk2.0-dev libhtml-form-perl \
              libjpeg-dev libmpfr-dev libpng-dev libterm-readkey-perl libtinyxml-dev \
                libtool libvtk5-dev libwww-perl make ninja-build perl pkg-config \
                  python-bs4 python-dev python-gtk2 python-html5lib python-numpy \
                    python-pip python-sphinx python-yaml unzip valgrind


## Set environment in .bashrc
echo "export CC=gcc-4.9 CXX=g++-4.9 FC=gforan-4.9" >> ~/.bashrc
