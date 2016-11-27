# portabledevops customized setting 
# By Robert Wang
# Sept 4th, 2016
# Usage: place this portabledevops.sh to git /etc/profile.d folder, will be sourced by /etc/profile when launch bash with option  '--login -i'

#
# Section - env setup
#
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

# portable calibre tool
if [ -d $PORTABLEPATH/calibre ]; then
	export PATH=$PORTABLEPATH/calibre/Calibre:$PATH
	alias calibrep=$PORTABLEPATH/calibre/calibre-portable.exe
fi

# portable docker toolbox
if [ -d $PORTABLEPATH/dockertoolbox ]; then 
	export DOCKERTOOLBOX=$PORTABLEPATH/dockertoolbox
	export PATH=$DOCKERTOOLBOX:$PATH
	alias dockerstart='cd $DOCKERTOOLBOX;./start.sh'
fi 

# portable vagrant
if [ -d $PORTABLEPATH/HashiCorp ]; then
	export PATH=$PORTABLEPATH/HashiCorp/Vagrant/bin:$PATH
fi

# portable virtualbox 
if [ -d $PORTABLEPATH/virtualbox ]; then 
	alias vboxp='cd $PORTABLEPATH/virtualbox; ./portablevbox.bat'
fi 

# portable python
PY2PATH=$PORTABLEPATH/python/Python27
PY3PATH=$PORTABLEPATH/python/Python34

export PATH=$PY2PATH:$PY2PATH/Scripts:$PY3PATH:$PY3PATH/Scripts:$PATH
alias py2="$PY2PATH/python.exe"
alias py3="$PY3PATH/python.exe"
alias pip2="$PY2PATH/python.exe $PY2PATH/Scripts/pip.exe"
alias pip3="$PY3PATH/python.exe $PY3PATH/Scripts/pip.exe"
alias ipy2="$PY2PATH/python.exe $PY2PATH/Scripts/ipython.exe"
alias ipy3="$PY3PATH/python.exe $PY3PATH/Scripts/ipython.exe"
alias jupy2="$PY2PATH/python.exe $PY2PATH/Scripts/jupyter.exe"
alias jupy3="$PY3PATH/python.exe $PY3PATH/Scripts/jupyter.exe"
alias easy2="$PY2PATH/python.exe $PY2PATH/Scripts/easy_install.exe"
alias easy3="$PY3PATH/python.exe $PY3PATH/Scripts/easy_install.exe"

# portable Golang
if [ -d $PORTABLEPATH/go ]; then
	export GOROOT=$PORTABLEPATH/go
	if [ ! -d $HOME/testgo ]; then
		mkdir -p $HOME/testgo
	fi 
	export GOPATH=$HOME/testgo
	export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
fi

# portable Lua
if [ -d $PORTABLEPATH/Lua ]; then
	export LUA_DEV=$PORTABLEPATH/Lua/5.1
	export LUA_PATH=$PORTABLEPATH/Lua/5.1/lua/?.luac
	export PATH=$LUA_DEV:$LUA_DEV/clibs:$PATH
fi

# portable R
if [ -d $PORTABLEPATH/R ]; then
	export PATH=$PORTABLEPATH/R/R-3.3.1/bin/x64:$PATH
fi

# portable ruby
if [ -d $PORTABLEPATH/ruby23 ]; then
	export PATH=$PORTABLEPATH/ruby23/bin:$PATH
fi

# portable nodejs
if [ -d $PORTABLEPATH/nodejs ]; then
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
fi

# portable git and bash
if [ -d $PORTABLEPATH/git ]; then
	export PATH=$PORTABLEPATH/git/bin:$PATH
fi

# portable mingw
if [ -d $PORTABLEPATH/mingw ];then
	export PATH=$PORTABLEPATH/mingw/bin:$PATH
fi

# portable cmder and cmdermini
if [ -d $PORTABLEPATH/cmdermini ]; then
	alias cmdermini=$PORTABLEPATH/cmdermini/cmder.exe
fi

# portable console2
if [ -d $PORTABLEPATH/console2 ]; then
	alias console=$PORTABLEPATH/console2/Console.exe
fi 

# portable dillinger
if [ -d $PORTABLEPATH/dillinger ]; then
	alias dill='$PORTABLEPATH/nodejs/node $PORTABLEPATH/dillinger/app'
fi

# portable gitbook editor
if [ -d $PORTABLEPATH/gitbookeditor ]; then
	export PATH=$PORTABLEPATH/gitbookeditor/app-6.2.1:$PATH
	alias gitbooked='cd $PORTABLEPATH/gitbookeditor/app-6.2.1;echo $HOME;$PORTABLEPATH/gitbookeditor/Update.exe --processStart Editor.exe'
fi

# portable nginx 
if [ -d $PORTABLEPATH/nginx ]; then
	export PATH=$PORTABLEPATH/nginx:$PATH
	alias nginxstart='cd $PORTABLEPATH/nginx; ./nginx'
	alias nginxstop='cd $PORTABLEPATH/nginx; ./nginx -s stop'
fi

# portable php
if [ -d $PORTABLEPATH/php ]; then
	export PATH=$PORTABLEPATH/php:$PATH
	alias phpcgi='cd $PORTABLEPATH/php; ./php-cgi -b 127.0.0.1:9000 -c ./php.ini'
fi

# portable mysql
if [ -d $PORTABLEPATH/mysql ]; then
	export PATH=$PORTABLEPATH/mysql/bin:$PATH
	alias mysqldstart='cd $PORTABLEPATH/mysql/bin; ./mysqld --console'
	alias mysqldstop='mysqladmin shutdown -u root -p'
fi

# portable redis
if [ -d $PORTABLEPATH/redis ]; then
	export PATH=$PORTABLEPATH/redis:$PATH
fi

alias nmpstart='source $PORTABLEPATH/nginx/nmp_start.sh'
alias nmpstop='source $PORTABLEPATH/nginx/nmp_stop.sh'

# ssh-agent 
eval $(ssh-agent -s)

if [ ! -e /home/$USERNAME/.ssh/id_rsa ]; then
	echo "ssh key not exist: /home/$USERNAME/.ssh/id_rsa"
	echo "please generate it using ssh-keygen"
else
	ssh-add /home/$USERNAME/.ssh/id_rsa
fi 
