#!/usr/bin/bash 
# portabledevops.sh
# mini customized setting for msys2/cygwin64
# By Robert Wang
# Dec 31, 2016

#
# Section - env setup
#
# this is important steps for portable, please don't touch it !!!
export PORTSYS=`uname|cut -d'_' -f1`

if [ $PORTSYS = 'MSYS' ]; then
	export USERPROFILE=$HOME
	export HOMEPATH=$HOME
fi 

cd $HOME

export HOMEDRIVEL=`cygpath -m \`pwd\` |cut -d: -f1`
export HOMEDRIVE=$HOMEDRIVEL:
export PORTFOLDER=`cygpath -m \`pwd\`|rev|cut -d'/' -f4-|rev|cut -d: -f2-`

if [ $PORTSYS = 'CYGWIN' ]; then
    export PORTABLEPATH=/cygdrive/$HOMEDRIVEL$PORTFOLDER
else
    export PORTABLEPATH=/$HOMEDRIVEL$PORTFOLDER
fi

#
# Section - portable application setup 
#
# pre-define some common used tools (alias and env), you can customize them depending on your own needs

# portable production tool
if [ -d $PORTABLEPATH/7z ]; then
	alias 7zp=$PORTABLEPATH/7z/7-ZipPortable.exe
	export PATH=$PORTABLEPATH/7z/App/7-Zip64:$PATH
fi
if [ -d $PORTABLEPATH/filezilla ]; then
	alias fzp=$PORTABLEPATH/filezilla/FileZillaPortable.exe
fi
if [ -d $PORTABLEPATH/qdir ]; then
	alias qdir=$PORTABLEPATH/qdir/Q-Dir.exe
fi
if [ -d $PORTABLEPATH/scite ]; then
	alias scite=$PORTABLEPATH/scite/SciTE.exe
fi
if [ -d $PORTABLEPATH/sublimetext3 ]; then
	alias st3=$PORTABLEPATH/sublimetext3/sublime_text.exe
fi
if [ -d $PORTABLEPATH/markdownpad2 ]; then
	alias mp=$PORTABLEPATH/markdownpad2/MarkdownPad2.exe
fi
if [ -d $PORTABLEPATH/kitty ]; then
	alias kitty=$PORTABLEPATH/kitty/kitty_portable.exe
fi
if [ -d $PORTABLEPATH/putty ]; then
	alias putty=$PORTABLEPATH/putty/putty.exe
fi

# portable docker toolbox 
if [ $PORTSYS = 'CYGWIN' ];then 
    export VBOX_MSI_INSTALL_PATH=/cygdrive/c/Program_Files/Oracle/VirtualBox/
else
    export VBOX_MSI_INSTALL_PATH=/c/Program_Files/Oracle/VirtualBox/
fi 

export PATH=$VBOX_MSI_INSTALL_PATH:$PATH
alias dm=/usr/local/bin/docker-machine.exe
alias dc=/usr/local/bin/docker-compose.exe
denv(){
	eval $(docker-machine env "$@")
}
export -f denv

# portable mingw64 on msys2
if [ $PORTSYS = 'MSYS' ];then
	export PATH=$PORTABLEPATH/msys64/mingw64/bin:$PATH
fi

# portable cmder and cmdermini
if [ -d $PORTABLEPATH/cmdermini ]; then
	alias cmdermini=$PORTABLEPATH/cmdermini/cmder.exe
fi

# portable console2
if [ -d $PORTABLEPATH/console2 ]; then
	alias console=$PORTABLEPATH/console2/Console.exe
fi 

# 
# Section - ssh agent
#
# it makes you easy life to ssh to github or any remote ssh server without specific ssh key path 
# please comment out this sesion if you don't need
eval $(ssh-agent -s)
 
if [ ! -e /home/$USERNAME/.ssh/id_rsa ]; then
	echo "ssh key not exist: /home/$USERNAME/.ssh/id_rsa"
	echo "please generate it using ssh-keygen"
else
	ssh-add /home/$USERNAME/.ssh/id_rsa
fi 

#
# Section - common alias
#
alias ll='ls -ltra'
alias pwdw='cygpath -m `pwd`'