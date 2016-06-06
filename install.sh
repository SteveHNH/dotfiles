#!/bin/bash
WORKDIR=`pwd`
HOME=/home/`whoami`
CONFDIR=${HOME}/.config

echo "######## INSTALLING DEPENDENCIES ########"
dnf install -y `cat dependencies`
dnf groupinstall "Development Tools"

echo "######## REGISTERING FONTS ########"
mkdir ${HOME}/.fonts
cp -r ./fonts/* ${HOME}/.fonts/
fc-cache

echo "######## INSTALL i3wm ########"
git clone ssh://git@github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install
