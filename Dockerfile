FROM ubuntu:20.04

ENV TZ=Asia/Chongqing \
    DEBIAN_FRONTEND=noninteractive

COPY ./cmake-3.27.7.tar.gz ./openocd-0.12.0.zip /root

RUN apt-get update && \
    apt-get install tzdata && \
    apt-get install --assume-yes apt-utils && \
    apt-get install -y gcc g++ libssl-dev make && \ 
    apt-get install -y gcc-arm-none-eabi && \
    apt-get install -y gcc-aarch64-linux-gnu g++-aarch64-linux-gnu && \
    apt-get install -y usbutils udev && \
    apt-get install -y build-essential pkg-config autoconf automake libtool libusb-dev libusb-1.0-0-dev libhidapi-dev && \
    apt-get install -y libtool libsysfs-dev && \
    apt-get install -y unzip && \
    tar -zxvf /root/cmake-3.27.7.tar.gz -C /root && \
    unzip /root/openocd-0.12.0.zip -d /root && \
    cd /root/cmake-3.27.7 && \
    ./configure && \
    make -j8 && \
    make install && \
    cd /root/openocd-0.12.0 && \
    ./configure && \
    make && \
    make install && \
    rm -r /root/cmake* /root/openocd*


