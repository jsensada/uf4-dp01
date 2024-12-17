#!/bin/bash
echo "--> Adding deadsnakes repository:"
sudo add-apt-repository ppa:deadsnakes/ppa -y

echo "--> Updating repositories and installing python3.12"
sudo apt update
sudo apt install python3.12 -y

echo "--> Python3.12 installed:"
python3 --version

echo "--> Installing pip3:"
sudo apt install python3-pip -y

echo "--> Creating the app directory:"
sudo mkdir -p /opt/app

echo "--> Copy all files:"
sudo cp app.py /opt/app/app.py
sudo cp requirements.txt /opt/app/requirements.txt

echo "--> Changing permissions:"
sudo chown jsensada:jsensada -R /opt/app

echo "--> Installing dependencies:"
sudo pip3 install -r /opt/app/requirements.txt --break-system-packages --ignore-installed

echo "--> Installing gunicorn:"
sudo apt install gunicorn -y

echo "--> Creating the new service app-web1:"
sudo cp app-web1.service /etc/systemd/system/app-web1.service

echo "--> Creating the new service app-web2:"
sudo cp app-web2.service /etc/systemd/system/app-web2.service

echo "--> Enabling the services:"
sudo systemctl daemon-reload
sudo systemctl enable app-web1
sudo systemctl enable app-web2
sudo systemctl start app-web1
sudo systemctl start app-web2
