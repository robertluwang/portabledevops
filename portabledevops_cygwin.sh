# portabledevops_cygwin.sh 
# customized setting for cygwin 
# By Robert Wang
# Dec 04, 2016
# Usage: place this portabledevops_cygwin.sh to cygwin /etc/profile.d folder, will be sourced by /etc/profile when launch bash with option  '--login -i'

#
# Section - env setup
#
cd $HOME

export HOMEDRIVEL=`cygpath -m \`pwd\` |cut -d: -f1`
export HOMEDRIVE=$HOMEDRIVEL:

# auto fetch portable devops tools folder, all tools under to this folder directly, 
# for example:  L:\portabledevops\cygwin64 or L:\oldhorse\portable\cygwin64

export PORTFOLDER=`cygpath -m \`pwd\`|rev|cut -d'/' -f4-|rev|cut -d: -f2-`
export PORTABLEPATH=/cygdrive/$HOMEDRIVEL$PORTFOLDER

#
# Section - portable application setup 
#
# portable production tool
if [ -d $PORTABLEPATH/7z ]; then
	alias 7zp=$PORTABLEPATH/7z/7-ZipPortable.exe
fi
if [ -d $PORTABLEPATH/imgburn ]; then
	alias img=$PORTABLEPATH/imgburn/ImgBurn.exe
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
if [ -d $PORTABLEPATH/greenshot ]; then
	alias gshot=$PORTABLEPATH/greenshot/Greenshot.exe
fi
if [ -d $PORTABLEPATH/kitty ]; then
	alias kitty=$PORTABLEPATH/kitty/kitty_portable.exe
fi
if [ -d $PORTABLEPATH/putty ]; then
	alias putty=$PORTABLEPATH/putty/putty.exe
fi
if [ -d $PORTABLEPATH/freecommander ]; then
	alias fc=$PORTABLEPATH/freecommander/FreeCommanderPortable.exe
fi
if [ -d $PORTABLEPATH/brackets ]; then
	alias bk=$PORTABLEPATH/brackets/BracketsPortable.exe
fi

# portable docker toolbox for cygwin
export VBOX_MSI_INSTALL_PATH=/cygdrive/c/Program_Files/Oracle/VirtualBox/
export PATH=$VBOX_MSI_INSTALL_PATH:$PATH
alias dm=/usr/local/bin/docker-machine.exe
alias dc=/usr/local/bin/docker-compose.exe
denv(){
	eval $(docker-machine env "$@")
}
export -f denv

# portable vagrant
if [ -d $PORTABLEPATH/vagrant ]; then
	export PATH=$PORTABLEPATH/vagrant/bin:$PATH
fi

# ssh-agent
eval $(ssh-agent -s)


if [ ! -e /home/$USERNAME/.ssh/id_rsa ]; then
	echo "ssh key not exist: /home/$USERNAME/.ssh/id_rsa"
	echo "please generate it using ssh-keygen"
else
	ssh-add /home/$USERNAME/.ssh/id_rsa
fi 

# common alias
alias ll='ls -ltra'
alias pwdw='cygpath -m `pwd`'

