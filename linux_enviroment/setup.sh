#!/bin/bash
# A script to help you initialize terminal (zsh) and Vim configuration in your new Linux environment.
#
# Terminal: zsh + oh-my-zsh
# Vim: Some basic configuration for easy operation
# 
# 2022/07/28

# update && install vim, etc.
sudo apt update -y
sudo apt install -y wget git vim zsh

# install oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then
	echo "oh-my-zsh is installed"
else
  # https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh
 	sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi
# .zshrc location
zshrc_filename="$HOME/.zshrc"

# install plugins for ohmyzsh
# zsh-autosuggestions
if [[ 'grep 'zsh-autosuggestions' $plugins' ]];then
    echo "zsh-autosuggestions is added." 
else
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    # update .zshrc for plugin zsh-autosuggestions
    if ! [[ 'grep 'zsh-autosuggestions' $zshrc_filename' ]];then
        sed -i 's/plugins=(/plugins=(zsh-autusuggestion /g' $zshrc_filename
    fi
fi

# zsh-syntax-highlighting
if [[ 'grep 'zsh-syntax-highlighting' $plugins' ]];then
    echo "zsh-syntax-highlighting is added."
else
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    # update .zshrc for plugin zsh-syntax-highlighting
    if ! [[ 'grep 'zsh-syntax-highlighting' $zshrc_filename' ]];then
        sed -i 's/plugins=(/plugins=(zsh-syntax-highlighting /g' $zshrc_filename
    fi
fi

# zsh-z
if [[ 'grep 'zsh-z' $plugins' ]];then
    echo "zsh-z is added." 
else
    git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
    # update .zshrc for plugin zsh-z
    if ! [[ 'grep 'zsh-z' $zshrc_filename' ]];then
        sed -i 's/plugins=(/plugins=(zsh-z /g' $zshrc_filename
    fi
fi

# configure vim
echo "syntax on\nset ts=4\nset expandtab\nset autoindent\nset number\nset relativenumber" > $HOME/.vimrc
