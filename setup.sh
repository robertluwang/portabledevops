#!/usr/bin/bash
# setup.sh - script to deploy or update portabledevops
# By Robert Wang
# Oct 8th, 2017
# Usage:
# launch msys2/cygwin bash shell from cmder or console
# cd ~ ; wget -qO- 'https://raw.githubusercontent.com/robertluwang/portabledevops/master/setup.sh' | sh

export PORTSYS=`uname|cut -d'_' -f1`

if [  `env|grep MOBANOACL` ]; then
	export PORTFOLDER=`echo $SYMLINKS|rev|cut -d'/' -f5-|rev|cut -d: -f2-`
	export HOMEDRIVEL=`echo $SYMLINKS|cut -d: -f1`
else 
	export PORTFOLDER=`cygpath -ml \`pwd\`|rev|cut -d'/' -f4-|rev|cut -d: -f2-`
	export HOMEDRIVEL=`cygpath -m \`pwd\` |cut -d: -f1`
fi 
export HOMEDRIVE=$HOMEDRIVEL:

if [ $PORTSYS = 'CYGWIN' ]; then
    export PORTABLEPATH=/cygdrive/$HOMEDRIVEL$PORTFOLDER
else
    export PORTABLEPATH=/$HOMEDRIVEL$PORTFOLDER
fi

cd ~
chmod 0700 .ssh/id_rsa

if [ -d ~/portabledevops ];then
    rm -r ~/portabledevops
fi

git clone git@github.com:robertluwang/portabledevops.git

cd portabledevops
# place the script portabledevops.sh to msys2/cygwin64 /etc/profile.d folder, will be sourced by /etc/profile when launch bash with option  '--login -i'
dos2unix.exe portabledevops.sh
echo cp portabledevops.sh to /etc/profile.d/
cp portabledevops.sh /etc/profile.d/

unzip dockertoolbox.zip

if [ ! -d $PORTABLEPATH/dockertoolbox ];then
    echo mkdir $PORTABLEPATH/dockertoolbox
    mkdir $PORTABLEPATH/dockertoolbox
fi

echo cp dockertoolbox/*  to $PORTABLEPATH/dockertoolbox
cp dockertoolbox/*  $PORTABLEPATH/dockertoolbox
chmod +x $PORTABLEPATH/dockertoolbox/*.exe