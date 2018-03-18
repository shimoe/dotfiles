#!/bin/bash
sudo apt-get install -y libcurl4-openssl-dev libsqlite3-dev gdebi
wget http://downloads.dlang.org/releases/2.x/2.073.2/dmd_2.073.2-0_amd64.deb
sudo gdebi dmd_2.073.2-0_amd64.deb

git clone git@github.com:skilion/onedrive.git
cd onedrive
make
sudo make install

mkdir -p ~/.config/onedrive
cp ./config ~/.config/onedrive/config

systemctl --user enable onedrive
systemctl --user start onedrive

onedrive
