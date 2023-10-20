#!/bin/bash

tag=0.2

build() {
  sudo docker build -f ./Dockerfile -t env_ede:$tag .
};

run() {
  sudo docker run -it -v /home:/home --name env_ede env_ede:$tag
  echo "run"
};

remove() {
  echo "remove"
};

if [ $1 == "build" ]
then
  build
elif [ $1 == "run" ]
then
  run
elif [ $1 == "remove" ]
then
  remove
else
  echo "没有符合的命令"
fi

