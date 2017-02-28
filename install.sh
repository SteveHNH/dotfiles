#!/bin/bash
WORKDIR=`pwd`
HOME=/home/`whoami`
CONFDIR=${HOME}/.config

echo "######## INSTALLING DEPENDENCIES and PACKAGES ########"
dnf copr enable yaroslav/i3desktop
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
cd ${WORKDIR}

echo "####### INSTALL polybar #######"
git clone --branch 3.0.4 --recursive ssh://git@github.com/jaagr/polybar
mkdir polybar/build
cd polybar/build
cmake ..
sudo make install
cd ${WORKDIR}
