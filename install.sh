#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade

sudo apt install build-essential dkms linux-headers-$(uname -r) -y
sudo mkdir -p /mnt/cdrom
sudo mount /dev/cdrom /mnt/cdrom
cd /mnt/cdrom
sudo sh ./VBoxLinuxAdditions.run --nox11

apt install build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev -y
mkdir python_installation && cd python_installation
wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz
tar -xf Python-3.9.1.tgz
rm -f Python-3.9.1.tgz
cd Python-3.9.1
./configure --enable-optimizations
make -j 4
make altinstall
cd ../..
rm -rf python_installation
apt --purge remove build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev -y
apt autoremove -y
apt clean
sudo apt install python3-pip
pip3 --version

sudo apt-get install git -y
git --version
git config --global user.name FrigusRex
git config --global user.email pranav.govekar@gmail.com
git config --list

sudo apt install cmatrix -y

cd 
mkdir .themes
cd nothingToSeeHere-main
mv Dracula.tar.xz /home/frigusrex/.themes
cd
cd .themes
tar -xf Dracula.tar.xz
rm -f Dracula.tar.xz

# sudo usermod -a -G vboxsf frigusrex
# sudo chown -R frigusrex :users /media/

# https://drive.google.com/file/d/1zPUu1Nn5eVD3465EyftaG5YSV4T2xqyL/view?usp=sharing wallpaper
# https://drive.google.com/file/d/1ygGcukIlk53y24XvQAMbrpL7SrwFCSaV/view?usp=sharing theme
