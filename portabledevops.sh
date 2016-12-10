# portabledevops.sh
# customized setting for msys2/cygwin64
# By Robert Wang
# Dec 10, 2016
# Usage: place this portabledevops.sh to msys2/cygwin64 /etc/profile.d folder, will be sourced by /etc/profile when launch bash with option  '--login -i'

#
# Section - env setup
#

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
# portable production tool
if [ -d $PORTABLEPATH/7z ]; then
	alias 7zp=$PORTABLEPATH/7z/7-ZipPortable.exe
	export PATH=$PORTABLEPATH/7z/App/7-Zip64:$PATH
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

# portable calibre tool
if [ -d $PORTABLEPATH/calibre ]; then
	export PATH=$PORTABLEPATH/calibre/Calibre:$PATH
	alias calibrep=$PORTABLEPATH/calibre/calibre-portable.exe
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

# portable vagrant
if [ -d $PORTABLEPATH/vagrant ]; then
	export PATH=$PORTABLEPATH/vagrant/bin:$PATH
fi

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

# common alias
alias ll='ls -ltra'
alias pwdw='cygpath -m `pwd`'