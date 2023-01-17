#!/bin/bash

apt update;apt upgrade -y

apt install curl -y
apt install docker -y
apt install docker-compose -y
apt install ansible -y

apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

curl https://packages.microsoft.com/keys/microsoft.asc |sudo apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list
echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" |sudo tee /etc/apt/sources.list.d/teams.list

apt update -y

apt install teams -y
apt install code -y

apt autoremove -y
