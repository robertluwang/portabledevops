# portabledevops customized setting 
# By Robert Wang
# Aug 28, 2016
# Usage: place this portabledevops.sh to git /etc/profile.d folder, will be sourced by /etc/profile when launch bash with option  '--login -i'

export HOMEDRIVEL=`pwd -W | cut -d: -f1`
export HOMEDRIVE=$HOMEDRIVEL:

if [ ! -d /home/$USERNAME ]; then
	echo "First time to run git/bash, create home folder: /home/$USERNAME"
	mkdir -p /home/$USERNAME
fi 

export HOME=/home/$USERNAME

export USERPROFILE=$HOME
export HOMEPATH=$HOME

cd $HOME

# auto fetch portable devops tools folder, all tools (includes git) under to this folder directly, 
# for example:  L:\portabledevops\git or L:\oldhorse\portable\git
# don't use cmder/Vendor structure since terminal could be different than cmder, for example console2.

# rev - string reverse tool which missing in msys, you can place rev binary to git /usr/bin folder
export PORTFOLDER=`pwd -W|rev|cut -d/ -f4-|rev|cut -d: -f2-`
export PORTABLEPATH=/$HOMEDRIVEL$PORTFOLDER

# production tool 
alias 7zp=$PORTABLEPATH/7z/7-ZipPortable.exe
alias img=$PORTABLEPATH/imgburn/ImgBurn.exe
alias fzp=$PORTABLEPATH/filezilla/FileZillaPortable.exe
alias qdir=$PORTABLEPATH/qdir/Q-Dir.exe
alias scite=$PORTABLEPATH/scite/SciTE.exe
alias st3=$PORTABLEPATH/sublimetext3/sublime_text.exe
alias gshot=$PORTABLEPATH/greenshot/Greenshot.exe
alias kitty=$PORTABLEPATH/kitty/kitty_portable.exe
alias putty=$PORTABLEPATH/putty/putty.exe

# portable calibre tool
export PATH=$PORTABLEPATH/calibre/Calibre:$PATH
alias calibrep=$PORTABLEPATH/calibre/calibre-portable.exe

# portable docker toolbox
export DOCKERTOOLBOX=$PORTABLEPATH/dockertoolbox
export PATH=$DOCKERTOOLBOX:$PATH
alias dockerstart='cd $DOCKERTOOLBOX;./start.sh'

# portable virtualbox 
#alias vboxp='cd $PORTABLEPATH/virtualbox; ./portablevbox.bat'

# portable python
alias mypy2='source /etc/mypy2.sh'
alias mypy3='source /etc/mypy3.sh'

# portable Golang
export GOROOT=$PORTABLEPATH/go
if [ ! -d $HOME/testgo ]; then
	mkdir -p $HOME/testgo
fi 
export GOPATH=$HOME/testgo
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# portable Lua
export LUA_DEV=$PORTABLEPATH/Lua/5.1
export LUA_PATH=$PORTABLEPATH/Lua/5.1/lua/?.luac
export PATH=$LUA_DEV:$LUA_DEV/clibs:$PATH

# portable R
export PATH=$PORTABLEPATH/R/R-3.3.1/bin/x64:$PATH

# portable ruby 
export PATH=$PORTABLEPATH/ruby23/bin:$PATH

# portable nodejs
export PATH=$PORTABLEPATH/nodejs/App/NodeJS:$PORTABLEPATH/nodejs/App/DefaultData:$PATH

# portable git and bash
export PATH=$PORTABLEPATH/git/bin:$PATH

# portable mingw
export PATH=$PORTABLEPATH/mingw/bin:$PATH

# portable cmder and cmdermini
alias cmdermini=$PORTABLEPATH/cmdermini/cmder.exe

# portable console2
alias console=$PORTABLEPATH/console2/Console.exe








