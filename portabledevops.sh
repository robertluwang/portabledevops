#!/usr/bin/bash 
# portabledevops.sh
# customized setting for msys2/cygwin64/mobaxterm
# By Robert Wang
# Oct 14, 2017

#
# Section - env setup
#

export PORTSYS=`uname|cut -d'_' -f1`

if [ $PORTSYS = 'MSYS' ] || [ $PORTSYS = 'MINGW32' ] || [ $PORTSYS = 'MINGW64' ]; then
    if [ ! -d /home/$USERNAME ]; then
        mkdir -p /home/$USERNAME
    fi
    HOME=/home/$USERNAME
    export USERPROFILE=$HOME
    export HOMEPATH=$HOME
fi 

cd $HOME

# portable mobaxterm, change persistent folder for root to <mobaxterm>/root , copy this portabledevops.sh to <mobaxterm>/root/etc/profile.d/ 

if [  `env|grep MOBANOACL` ]; then
    export PORTFOLDER=`echo $SYMLINKS|rev|cut -d'/' -f5-|rev|cut -d: -f2-`
    export HOMEDRIVEL=`echo $SYMLINKS|cut -d: -f1`
else
    # portable babun 
    if [ `env|grep BABUN_HOME` ];then
        export PORTFOLDER=`echo $BABUN_HOME|rev|cut -d/ -f2-|rev|cut -d: -f2-`
        export HOMEDRIVEL=`echo $BABUN_HOME|cut -d: -f1`
    else
        export PORTFOLDER=`cygpath -ml \`pwd\`|rev|cut -d'/' -f4-|rev|cut -d: -f2-`
        export HOMEDRIVEL=`cygpath -m \`pwd\` |cut -d: -f1`
    fi
fi 
export HOMEDRIVE=$HOMEDRIVEL:

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

# setup VirtualBox path 
if [ $PORTSYS = 'CYGWIN' ];then 
    export VBOX_MSI_INSTALL_PATH=/cygdrive/c/Program_Files/Oracle/VirtualBox/
else
    export VBOX_MSI_INSTALL_PATH=/c/Program_Files/Oracle/VirtualBox/
fi 

export PATH=$VBOX_MSI_INSTALL_PATH:$PATH

# portable docker toolbox
if [ -d $PORTABLEPATH/dockertoolbox ]; then
    export PATH=$PORTABLEPATH/dockertoolbox:$PATH
    alias dm=$PORTABLEPATH/dockertoolbox/docker-machine.exe
    alias dc=$PORTABLEPATH/dockertoolbox/docker-compose.exe

    # function to setup env for docker vm host
    denv(){
       eval $(dm env "$@")
    }
    export -f denv

    # directly ssh to docker vm when docker-machine env not working well
    dmssh(){
        sshport=`VBoxManage showvminfo "$1"|grep 127.0.0.1|grep ssh |awk -F',' '{print $4}'|awk -F'=' '{print $2}'`
        sshkeywinpath=`dm inspect "$1"|grep SSHKeyPath|awk '{print $2}'|awk -F, '{print $1}'|awk -F\" '{print $2}'`
        sshkeycygpath=`cygpath -ml $sshkeywinpath`
        sshkeydrive=`echo $sshkeycygpath|awk -F:  '{print $1}'`
        sshkeypath=`echo $sshkeycygpath|awk -F:  '{print $2}'`
        if [ $PORTSYS = 'CYGWIN' ]; then
           sshkey='/cygdrive/'$sshkeydrive$sshkeypath
        else
           sshkey='/'$sshkeydrive$sshkeypath
        fi

        shift
        ssh -o PasswordAuthentication=no -o StrictHostKeyChecking=no docker@127.0.0.1 -o IdentitiesOnly=yes -i $sshkey -p $sshport "$@"
    }
    export -f dmssh

    # alias for Go native ssh when local ssh client not working
    alias nassh='dm --native-ssh ssh'

fi

# portable vagrant
if [ -d $PORTABLEPATH/vagrant ]; then
    export PATH=$PORTABLEPATH/vagrant/bin:$PATH
fi

# portable netsnmp
if [ -d $PORTABLEPATH/netsnmp ]; then
    export PATH=$PORTABLEPATH/netsnmp/usr/bin:$PATH
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
    #export LUA_PATH=$PORTABLEPATH/Lua/5.1/lua/?.luac
    export PATH=$LUA_DEV:$LUA_DEV/clibs:$PATH
    alias lua=$LUA_DEV/lua.exe
fi

# portable R
if [ -d $PORTABLEPATH/R ]; then
    export PATH=$PORTABLEPATH/R/R-3.3.1/bin/x64:$PATH
fi

# portable ruby
if [ -d $PORTABLEPATH/ruby23 ]; then
    export PATH=$PORTABLEPATH/ruby23/bin:$PATH
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
    alias console2=$PORTABLEPATH/console2/Console.exe
fi 

# portable consolez
if [ -d $PORTABLEPATH/consolez ]; then
    alias consolez=$PORTABLEPATH/consolez/Console.exe
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
    alias nmpstart='source $PORTABLEPATH/nginx/nmp_start.sh'
    alias nmpstop='source $PORTABLEPATH/nginx/nmp_stop.sh'
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

# portable wkhtmltopdf
if [ -d $PORTABLEPATH/wkhtmltopdf ]; then
    export PATH=$PORTABLEPATH/wkhtmltopdf:$PORTABLEPATH/wkhtmltopdf/bin:$PATH
fi

# portable git
if [ -d $PORTABLEPATH/git ]; then
    export PATH=$PATH:$PORTABLEPATH/git/mingw64/bin
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
alias pwdw='cygpath -ml `pwd`'

# welcome 
echo
echo "Welcome to portabledevops"
echo "Platform: "$PORTSYS
echo "Home: "$HOME
echo "Portable path: "$PORTFOLDER
echo "Driver: "$HOMEDRIVEL
echo "Shortcut: alias|grep "$PORTFOLDER
date
echo
