FROM ubuntu:20.04

COPY ./cmake-3.27.7.tar.gz /root

RUN apt-get update \
    && apt install gcc g++ libssl-dev make -y \
    && tar -zxvf /root/cmake-3.27.7.tar.gz -C /root \
    && cd /root/cmake-3.27.7 \
    && ./configure \
    && make -j8 \
    && make install \
    && rm -r /root/cmake* \
    && apt install gcc-arm-none-eabi -y \
    && apt install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu -y\
    
