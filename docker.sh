#!bin/bash

tag=0.1

build() {
  #sudo docker build -f ./Dockerfile -t easy_ede:$tag
  echo "build"
};

run() {
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

