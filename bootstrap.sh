#!/usr/bin/env bash

# Add Python repository
add-apt-repository ppa:deadsnakes/ppa

# Update package list again
apt-get update

# Install packages
apt-get install git

# Install pipenv
pip install pipenv


