#!/bin/bash

check() {
	if [ ! "$(command -v yadm)" ]; then
		sudo apt install yadm -y
		yadm clone https://github.com/Darren-Serious/dotfiles.git
	else
		echo "yadm has install, version is `yadm --version`"
	fi

	if [ ! "$(command -v fish)" ]; then
		sudo apt install fish -y
		chsh -s /usr/bin/fish
	else
		echo "fish has install, version is `fish -v`"
	fi

	if [ ! "$(command -v tmux)" ]; then
		sudo apt install tmux -y
	else
		echo "tmux has install, version is `tmux -V`"
	fi

	if [ ! "$(command -v docker)" ]; then
    sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt update
    sudo apt install docker-ce docker-ce-cli containerd.io
	else
		echo "docker has install, version is `docker -v`"
	fi

	if [ ! "$(command -v zerotier-one)" ]; then
		curl -s https://install.zerotier.com | sudo bash
		sudo zerotier-cli join b15644912eb29958
	else
		echo "zerotier-one has install, version is `zerotier-one -v`"
	fi
	
	if [ ! "$(command -v nvim)" ]; then
		sudo add-apt-repository ppa:neovim-ppa/unstable
		sudo apt-get update
		sudo apt-get install python2-dev python-pip python3-dev python3-pip 
		sudo apt install neovim
	else
		echo "neovim has install, version is `nvim -v | awk 'NR==1'`"
	fi
}


check
