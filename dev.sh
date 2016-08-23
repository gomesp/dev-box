#!/usr/bin/env bash

# 1. Install oh-my-zsh
sudo apt-get update -y
sudo apt-get install -y zsh git-core
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo chsh -s $(which zsh)
