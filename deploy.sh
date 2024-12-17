#!/bin/bash
echo "--> Adding deadsnakes repository:"
sudo add-apt-repository ppa:deadsnakes/ppa -y

echo "--> Updating repositories and installing python3.12"
sudo apt update
sudo apt install python3.12

echo "--> Python3.12 installed:"
python3 --version
