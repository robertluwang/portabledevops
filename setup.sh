#!/usr/bin/bash
# setup.sh - script to deploy or update portabledevops
# By Robert Wang
# Usage:
# launch msys2/cygwin bash shell from cmder or console
# cd ~ ; wget -qO- 'https://raw.githubusercontent.com/robertluwang/portabledevops/master/setup.sh' | sh

cd ~
chmod 0700 .ssh/id_rsa

if [ -d ~/portabledevops ];then
    rm -r ~/portabledevops
fi 

git clone git@github.com:robertluwang/portabledevops.git 

cd portabledevops
# place the script portabledevops.sh to msys2/cygwin64 /etc/profile.d folder, will be sourced by /etc/profile when launch bash with option  '--login -i'   
dos2unix.exe portabledevops.sh
echo cp portabledevops.sh /etc/profile.d/
cp portabledevops.sh /etc/profile.d/ 
# install docker toolbox locally
unzip dockertoolbox.zip
mkdir -p /usr/local/bin
echo cp dockertoolbox/docker*.exe /usr/local/bin/
cp dockertoolbox/docker*.exe /usr/local/bin/
chmod +x /usr/local/bin/docker*.exe