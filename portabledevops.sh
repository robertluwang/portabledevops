# portabledevops customized setting 
# By Robert Wang
# Aug 15, 2016
# Usage: place this portabledevops.sh to git/msys etc/profile.d folder, will be sourced by etc/profile  when launch bash with option  '--login -i'

export HOMEDRIVEL=`pwd -W | cut -d: -f1`
export HOMEDRIVE=$HOMEDRIVEL:

if [ ! -d /home/$USERNAME ]; then
	mkdir -p /home/$USERNAME
fi 

export HOME=/home/$USERNAME

export DEVOPS=$HOMEDRIVE/portabledevops

# production tool 
alias 7zp='/$HOMEDRIVEL/portabledevops/7-ZipPortable/7-ZipPortable.exe'
alias img='/$HOMEDRIVEL/portabledevops/ImgBurnPortable/ImgBurn.exe'
alias fzp='/$HOMEDRIVEL/portabledevops/FileZillaPortable/FileZillaPortable.exe'
alias qdir='/$HOMEDRIVEL/portabledevops/Q-Dir_Portable/Q-Dir.exe'
alias scite='/$HOMEDRIVEL/portabledevops/SciTEPortable/SciTE.exe'
alias st3='/$HOMEDRIVEL/portabledevops/SublimeText3/sublime_text.exe'
alias gshot='/$HOMEDRIVEL/portabledevops/Greenshot/Greenshot.exe'
alias kitty='/$HOMEDRIVEL/portabledevops/Kitty/kitty_portable.exe'

# portable calibre tool
export PATH=/$HOMEDRIVEL/portabledevops/CalibrePortable/Calibre:$PATH

# portable docker toolbox
export DOCKERTOOLBOX=/$HOMEDRIVEL/portabledevops/portableDockerToolbox
export PATH=$DOCKERTOOLBOX:$PATH
alias dockerstart='cd $DOCKERTOOLBOX;./start.sh'

# portable virtualbox 
export VIRTUALBOX=/$HOMEDRIVEL/portabledevops/VirtualBox
export PATH=$VIRTUALBOX:$PATH

# portable python
alias mypy2='source /etc/mypy2.sh'
alias mypy3='source /etc/mypy3.sh'

# portable Golang
export GOROOT=/$HOMEDRIVEL/portabledevops/go
if [ ! -d $HOME/testgo ]; then
	mkdir -p $HOME/testgo
fi 
export GOPATH=$HOME/testgo
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# portable lua
export LUA_DEV=/$HOMEDRIVEL/portabledevops/Lua/5.1
export LUA_PATH=/$HOMEDRIVEL/portabledevops/Lua/5.1/lua/?.luac
export PATH=$LUA_DEV:$LUA_DEV/clibs:$PATH

# portable R
export PATH=/$HOMEDRIVEL/portabledevops/R/R-3.3.1/bin/x64:$PATH

# portable nodejs
export PATH=/$HOMEDRIVEL/portabledevops/nodejs:/$HOMEDRIVEL/portabledevops/nodejs/appdata/npm:$PATH

# portable git and bash
CMDERVER=`echo $CMDER_ROOT| awk -F/ '{print $NF}'`
if [ $CMDERVER == cmdermini ]; then 
	export PATH=/$HOMEDRIVEL/portabledevops/PortableGit/bin:$PATH
fi

# portable mingw
export PATH=/$HOMEDRIVEL/portabledevops/mingw/bin:$PATH

# portable cmder and cmdermini
alias cmdermini='/$HOMEDRIVEL/portabledevops/cmdermini/cmder.exe'
alias cmder='/$HOMEDRIVEL/portabledevops/cmder/cmder.exe'

# portable console2
alias console='/$HOMEDRIVEL/portabledevops/Console2/Console.exe'

cd $HOME






