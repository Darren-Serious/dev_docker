#!/bin/bash

tag=0.2

build() {
  sudo docker build -f ./Dockerfile -t env_ede:$tag .
  sudo docker run -it -v /home:/home --name env_ede env_ede:$tag
};

if [ $1 == "build" ]
then
  build
else
  echo "没有符合的命令"
fi

