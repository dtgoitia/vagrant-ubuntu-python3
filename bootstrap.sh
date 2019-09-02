#!/usr/bin/env bash

# Add Python PPA (Personal Package Archive)
# echo "================================="
# echo ""
# echo "adding fkrull/deadsnakes PPA for Python 3"
# add-apt-repository ppa:fkrull/deadsnakes

# Update package list again
apt-get update

# Install packages
apt-get --assume-yes install git \
                             fish \
                             tmux \
                             curl \
                             vim

#-------------------------------------------------------------------------
#  Set up custom configuration
#-------------------------------------------------------------------------

# Delete previos dotfiles
rm -f ~/.bashrc*
rm -f ~/.tmux.conf*
rm -f ~/.gitconfig*
rm -f ~/.vimrc*
rm -rf ~/.config
rm -rf ~/.vim/

# Fetch dotfiles
BASE_URL="https://raw.githubusercontent.com/dtgoitia/dotfiles/master"

wget --no-verbose "${BASE_URL}/.bashrc"
wget --no-verbose "${BASE_URL}/.tmux.conf"
mkdir -p ~/.config/fish
wget --no-verbose -O ~/.config/fish "${BASE_URL}/.config/fish/config.fish"
wget --no-verbose "${BASE_URL}/.gitconfig"
mkdir -p ~/.vim/colors
wget --no-verbose -O ~/.vim/colors/solarized.vim "${BASE_URL}/.vim/colors/solarized.vim"
wget --no-verbose "${BASE_URL}/.vimrc"

# Install Python tools
echo "======================================================"
echo ""
echo "installing python 3 pip"
apt-get --assume-yes install python3-pip
sudo pip3 install pipenv
sudo pip3 install powerline-status

# Set Python 3 as default
echo "source ~/.bash_aliases" >> ~/.bashrc
echo "alias python=python3" >> ~/.bash_aliases
echo "alias py=python3" >> ~/.bash_aliases
echo "alias pip=pip3" >> ~/.bash_aliases

echo "alias python python3" >> ~/.config/fish/config.fish
echo "alias pip pip3" >> ~/.config/fish/config.fish

mkdir projects
cd projects
git clone git@github.com:dtgoitia/abot.git
cd abot
pipenv install --dev