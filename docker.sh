#!/bin/bash

tag=0.2

build() {
  sudo docker build -f ./Dockerfile -t env_ede:$tag .
  sudo docker run -it --privileged -v /home:/home -v /dev/bus/usb:/dev/bus/usb --name env_ede env_ede:$tag
};

remove() {
  if [[ -n $(sudo docker ps -q -f "name=^env_ede$") ]];then
    sudo docker stop env_ede
  fi
  sudo docker rm env_ede
  sudo docker rmi env_ede:$tag
}

if [ $1 == "build" ]
then
  build
elif [ $1 == "remove" ]
then
  remove
else
  echo "没有符合的命令"
fi

