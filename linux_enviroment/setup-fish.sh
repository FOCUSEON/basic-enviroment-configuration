#!/bin/bash
# A script to install fish and some common apps in your new Linux environment.
#
# Terminal: fish
# 
# 2022/08/01

# update && install vim, etc.
sudo apt update -y
sudo apt install -y wget git vim fish

chsh -s /usr/local/bin/fish

echo /usr/local/bin/fish | sudo tee -a /etc/shells