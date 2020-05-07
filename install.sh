#!/bin/bash

cp /etc/apt/sources.list /etc/apt/sources.list_bkp

cd /etc/apt/
echo > sources.list

echo "#------------------------------------------------------------------------------#
#                   OFFICIAL DEBIAN REPOS                    
#------------------------------------------------------------------------------#

###### Debian Main Repos
deb http://deb.debian.org/debian/ stable main contrib non-free
deb-src http://deb.debian.org/debian/ stable main contrib non-free

deb http://deb.debian.org/debian/ stable-updates main contrib non-free
deb-src http://deb.debian.org/debian/ stable-updates main contrib non-free

deb http://deb.debian.org/debian-security stable/updates main
deb-src http://deb.debian.org/debian-security stable/updates main

deb http://ftp.debian.org/debian buster-backports main
deb-src http://ftp.debian.org/debian buster-backports main

#------------------------------------------------------------------------------#
#                      UNOFFICIAL  REPOS                       
#------------------------------------------------------------------------------#

###### 3rd Party Binary Repos
###Adapta GTK Theme
deb http://ppa.launchpad.net/tista/adapta/ubuntu bionic main
deb-src http://ppa.launchpad.net/tista/adapta/ubuntu bionic main

###Debian Multimedia
deb [arch=amd64,i386] https://www.deb-multimedia.org buster main non-free

###Google Chrome Browser
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main

###Icon Repo
deb http://ppa.launchpad.net/noobslab/icons/ubuntu bionic main
deb-src http://ppa.launchpad.net/noobslab/icons/ubuntu artful main

" >> sources.list

# Instalando pacotes
sudo apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys EAC0D406E5D79A82ADEEDFDFB76E53652D87398A
wget http://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb && sudo dpkg -i deb-multimedia-keyring_2016.8.1_all.deb
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys D530E028F59EAE4D


# Update e Upgrade
sudo apt update && sudo apt upgrade -y


# Install My Packages
sudo apt install rar unrar zip unzip snap git python-pip3 smplayer pitivi net-tools whois docker docker-compose google-chrome-stable gnome-tweak-tool vokoscreen -y


# Install spotify and slack
sudo snap install slack --classic && sudo snap install spotify

# Install VSCODE
cd /tmp

wget https://az764295.vo.msecnd.net/stable/ff915844119ce9485abfe8aa9076ec76b5300ddd/code_1.44.2-1587059832_amd64.deb

sudo dkpg -i *.deb

sudo apt install -f

# Install TERRAFORM
wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip

unzip *.zip

sudo mv terraform_0.12.24_linux_amd64/terraform /usr/local/bin/


sudo apt autoremove -y
