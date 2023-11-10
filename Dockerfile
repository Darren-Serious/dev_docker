FROM ubuntu:20.04

ENV TZ=Asia/Chongqing \
    DEBIAN_FRONTEND=noninteractive

COPY ./cmake-3.27.7.tar.gz ./openocd-0.12.0.zip /root

RUN sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list && \
    sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list && \
    apt-get update && \
    apt-get install tzdata && \
    apt-get install --assume-yes apt-utils && \
    apt-get install -y gcc g++ libssl-dev make && \ 
    apt-get install -y gcc-arm-none-eabi && \
    apt-get install -y gcc-aarch64-linux-gnu g++-aarch64-linux-gnu && \
    apt-get install -y usbutils udev && \
    apt-get install -y build-essential pkg-config autoconf automake libtool libusb-dev libusb-1.0-0-dev libhidapi-dev && \
    apt-get install -y libtool libsysfs-dev && \
    apt-get install -y unzip && \
    apt-get install -y python3 && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    apt-get install -y flex bison bc lz4 device-tree-compiler
RUN tar -zxvf /root/cmake-3.27.7.tar.gz -C /root && \
    cd /root/cmake-3.27.7 && \
    ./configure && \
    make -j8 && \
    make install && \
    rm -r /root/cmake*
RUN unzip /root/openocd-0.12.0.zip -d /root && \
    cd /root/openocd-0.12.0 && \
    ./configure && \
    make && \
    make install && \
    rm -r /root/openocd*


