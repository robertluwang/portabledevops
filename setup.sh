#!/usr/bin/bash
# setup.sh - script to deploy or update portabledevops
# By Robert Wang
# Feb 7th, 2019
# Usage:
# launch msys2/cygwin/mobaxterm/WSL bash shell
# cd ~ ; wget -qO- 'https://raw.githubusercontent.com/robertluwang/portabledevops/master/setup.sh' | sh

export DEFPORTFOLDER=portabledevops
export DEFHOMEDRIVEL=c

export PORTSYS=`uname|cut -d'_' -f1`

if [ $PORTSYS = 'MSYS' ] || [ $PORTSYS = 'MINGW32' ] || [ $PORTSYS = 'MINGW64' ]; then
    if [ ! -d /home/$USERNAME ]; then
        mkdir -p /home/$USERNAME
    fi
    HOME=/home/$USERNAME
    export USERPROFILE=$HOME
    export HOMEPATH=$HOME
elif [ $PORTSYS = 'Linux' ] && [ `uname -a|awk '{print $4}'|cut -d'-' -f2` = Microsoft ];then
    export USERNAME=$USER
    export USERPROFILE=$HOME
    export HOMEPATH=$HOME
fi

cd $HOME

# portable mobaxterm, change persistent folder for root to <mobaxterm>/root , copy this portabledevops.sh to <mobaxterm>/root/etc/profile.d/ 

if [  `env|grep MOBANOACL` ]; then
    export PORTFOLDER=`echo $SYMLINKS|rev|cut -d'/' -f5-|rev|cut -d: -f2-`
    export HOMEDRIVEL=`echo $SYMLINKS|cut -d: -f1`
elif [ `env|grep BABUN_HOME` ];then
    export PORTFOLDER=`echo $BABUN_HOME|rev|cut -d/ -f2-|rev|cut -d: -f2-`
    export HOMEDRIVEL=`echo $BABUN_HOME|cut -d: -f1`
elif [ $PORTSYS = 'Linux' ] && [ `uname -a|awk '{print $4}'|cut -d'-' -f2` = Microsoft ];then
    export PORTFOLDER=$DEFPORTFOLDER
    export HOMEDRIVEL=$DEFHOMEDRIVEL
else
    export PORTFOLDER=`cygpath -ml \`pwd\`|rev|cut -d'/' -f4-|rev|cut -d: -f2-`
    export HOMEDRIVEL=`cygpath -m \`pwd\` |cut -d: -f1`
fi 

if [ $PORTSYS = 'CYGWIN' ]; then
    export PORTABLEPATH=/cygdrive/$HOMEDRIVEL$PORTFOLDER
elif [ $PORTSYS = 'Linux' ] && [ `uname -a|awk '{print $4}'|cut -d'-' -f2` = Microsoft ];then
    export PORTABLEPATH=/mnt/$HOMEDRIVEL/$PORTFOLDER
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
dos2unix portabledevops.sh
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
