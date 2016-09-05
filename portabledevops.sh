# portabledevops customized setting 
# By Robert Wang
# Sept 4th, 2016
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
alias mp=$PORTABLEPATH/markdownpad2/MarkdownPad2.exe
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
export PATH=$PORTABLEPATH/nodejs:$PATH

if [ ! -d $PORTABLEPATH/nodejs/.node_modules_global ]; then
	echo "First time to create npm modules global: $PORTABLEPATH/nodejs/.node_modules_global"
	mkdir -p $PORTABLEPATH/nodejs/.node_modules_global
fi
$PORTABLEPATH/nodejs/npm config set prefix=$PORTABLEPATH/nodejs/.node_modules_global

if [ ! -d $PORTABLEPATH/nodejs/npm-cache ]; then
	echo "First time to create npm-cache: $PORTABLEPATH/nodejs/npm-cache"
	mkdir -p $PORTABLEPATH/nodejs/npm-cache
fi
$PORTABLEPATH/nodejs/npm config set cache=$PORTABLEPATH/nodejs/npm-cache

if [ ! -d $PORTABLEPATH/home/$USERNAME/AppData/Local/Temp ]; then
	echo "First time to create tmp: $PORTABLEPATH/home/$USERNAME/AppData/Local/Temp"
	mkdir -p $PORTABLEPATH/home/$USERNAME/AppData/Local/Temp
fi
$PORTABLEPATH/nodejs/npm config set tmp=$PORTABLEPATH/home/$USERNAME/AppData/Local/Temp

export PATH=$PORTABLEPATH/nodejs/.node_modules_global:$PATH

# portable git and bash
export PATH=$PORTABLEPATH/git/bin:$PATH

# portable mingw
export PATH=$PORTABLEPATH/mingw/bin:$PATH

# portable cmder and cmdermini
alias cmdermini=$PORTABLEPATH/cmdermini/cmder.exe

# portable console2
alias console=$PORTABLEPATH/console2/Console.exe

# portable dillinger
alias dill='$PORTABLEPATH/nodejs/node $PORTABLEPATH/dillinger/app'

# portable gitbook editor
export PATH=$PORTABLEPATH/gitbookeditor/app-6.2.1:$PATH
alias gitbooked='cd $PORTABLEPATH/gitbookeditor/app-6.2.1;$PORTABLEPATH/gitbookeditor/Update.exe --processStart Editor.exe'

# ssh-agent 
eval $(ssh-agent -s)

if [ ! -e /home/$USERNAME/.ssh/id_rsa ]; then
	echo "ssh key not exist: /home/$USERNAME/.ssh/id_rsa"
	echo "please generate it using ssh-keygen"
else
	ssh-add /home/$USERNAME/.ssh/id_rsa
fi 
