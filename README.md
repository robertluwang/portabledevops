# portabledevops

A portable devops tool set on windows, easy customization of cmder/console+msys2/cygwin/mobaxterm/WSL.

## 1 Background

[Cmder](https://github.com/cmderdev/cmder) is a software package created out of pure frustration over absence of usable console emulator on Windows. It is based on ConEmu. There are two version of cmder: cmder with own Git for Windows and cmdermini without git and bash. I used cmdermini as lightweight xterm with bash/git from msys or cygwin.

[Console](https://sourceforge.net/projects/console/) is another lightweight windows console enhancement, supports multi-tabs.

[Cygwin](https://cygwin.com/) is a large collection of GNU and Open Source tools which provide functionality similar to a Linux distribution on Windows, also provides substantial POSIX API functionality.

[MobaXterm](https://mobaxterm.mobatek.net/) provides all the important remote network tools (SSH, X11, RDP, VNC, FTP, MOSH, ...) and Unix commands (bash, ls, cat, sed, grep, awk, rsync, ...) to Windows desktop, in a single portable exe file. The Unix commands are from cygwin but little bit customized.

[MSYS](http://www.mingw.org/wiki/MSYS) is a collection of GNU utilities such as bash, make, gawk and grep to allow building of applications and programs which depend on traditionally UNIX tools to be present. It is lightweight *NIX shell on windows. The [MSYS2](https://sourceforge.net/projects/msys2/?source=navbar) is an independent rewrite of MSYS, based on modern Cygwin (POSIX compatibility layer) and MinGW-w64 with the aim of better interoperability with native Windows software.

[WSL](https://docs.microsoft.com/en-us/windows/wsl/about) The Windows Subsystem for Linux lets developers run GNU/Linux environment -- including most command-line tools, utilities, and applications -- directly on Windows, unmodified, without the overhead of a virtual machine.

## 2 What is portabledevops?
it is portable practice approach to integrate all portable devops tools into one portable folder running on usb or portable disk 

## 3 portabledevops folder structure sample: 
&lt;drive&gt;:\portabledevops\  
* productive tools      
```
qdir/   
7z/   
filezilla/   
scite/                 
sublimetext3/  
kitty/  
```
* nix 
```
cygwin64/ 
msys64/
mobaxterm/
```
* shell 
```
cmdermini/             
console2/
```
* vm and docker tool
```
dockertoolbox/        
```

## 4 portabledevops files list 
``` 
portabledevops.sh - mini portable all-in-one customization setting for msys2/cygwin64/wsl
dockertoolbox.zip - collection of portable docker toolbox win binary files
README.md - this file   
```

## 5 How to setup portabledevops?

It is pretty easy, the idea is to place all portable customization in one place, and flexible to any window DOS replacement - shell terminal like cmder, console etc. 

### 5.1 create portabledevops root folder on USB drive
for example: 
```
L:\portabledevops
```

### 5.2 make junction (directory hard link) for “Program Files”
it will make easy to find VirtualBox tools  
from cmd.exe 
```
mklink /j  C:\Program_Files  "C:\Program Files"
Junction created for C:\Program_Files <<===>> C:\Program Files
mklink /j  C:\Program_Files_x86 "C:\Program Files (x86)"
Junction created for C:\Program_Files_x86 <<===>> C:\Program Files (x86)
```

### 5.3 install portable shell  
L:\portabledevops\cmdermini - download and unzip cmdermini from [cmder_mini.zip](https://github.com/cmderdev/cmder/releases) to this folder
L:\portabledevops\console2  - download and unzip console2 from [console2 zip](https://sourceforge.net/projects/console/) to this folder

### 5.4 install portable msys2 
- download msys2-x86_64-xxx.exe from [http://msys2.github.io/](http://msys2.github.io/)
- install to default location C:\msys64
- copy C:\msys64 to L:\portabledevops\msys64
- uninstall msys64 from windows
- launch msys2.exe from L:\portabledevops\msys64 folder
- at bash shell, install necessary package for dev env on msys2 
```
pacman -Sy base-devel mingw-w64-x86_64-gcc python git zip unzip p7zip
wget -qO- https://bootstrap.pypa.io/get-pip.py | python2
```

### 5.5 install portable cygwin64 
- download cygwin64 from [https://www.cygwin.com/setup-x86_64.exe](https://www.cygwin.com/setup-x86_64.exe)
- move setup-x86_64.exe to L:\portabledevops\cygwin64 folder
- click setup-x86_64.exe
only install wget, choice install folder and package folder to L:\portabledevops\cygwin64,it will install cygwin 64 core package. 
- click Cygwin.bat to launch cygwin bash shell
- install apt-cyg
```
wget raw.github.com/transcode-open/apt-cyg/master/apt-cyg
chmod +x apt-cyg
mv apt-cyg /usr/local/bin
which -a apt-cyg
```
- install git, python-devel, gcc-g++, curl, zip, unzip 
```
apt-cyg install git python-devel gcc-g++ curl zip unzip
```
- install pip
```
wget -qO- 'https://bootstrap.pypa.io/get-pip.py' | python2
```

### 5.6 install portable mobaxterm
- download mobaxterm from [https://mobaxterm.mobatek.net](https://mobaxterm.mobatek.net/download.html)
- move mobaxterm folder to L:\portabledevops\
- launch MobaXterm.exe, click Setting->General
- change persistent root(/) directory to mobaxterm/root
- change home directory to mobaxterm/home or C:\Users\USERNAME
- install git, zip
```
apt-cyg install git zip
```
- install pip
```
wget -qO- 'https://bootstrap.pypa.io/get-pip.py' | python2
```

## 6 git setup
* start cmder bash shell 
``` 
launch cmder by double click Cmder.exe under cmdermini/ folder 
launch msys64 task from right-bottom menu 
```
similar for console2 bash shell
* git user/email setup 
```
$ git config --global user.name "<username>"
$ git config --global user.email "<email for git>"
verify:
$ git config --global --list
```
* generate ssh key 
```
$ ssh-keygen -t rsa -C "<email for git>"
empty for passphrase
will generate private ssh key: /home/<username>/.ssh/id_rsa, public key: /home/<username>/.ssh/id_rsa.pub 
```
* change permission of private key
```
chmod 700 /home/<username>/.ssh/id_rsa
```
* add private key to ssh agent 
```
$ eval $(ssh-agent -s)
$ ssh-add /home/<username>/.ssh/id_rsa
```
* upload id_rsa.pub to github account Settings
```
copy content of id_rsa.pub to clipboard: 
$ cat /home/<username>/.ssh/id_rsa.pub 
click github Settings/"SSH and GPG keys"/"Add SSH key" button:
paste to Key field, give the Title name, then click "Add SSH key" button.
```
* verify ssh connection to github
```
$ ssh -T git@github.com
```

## 7 deploy portabledevops 
* place all-in-one portable customization setting to msys2/cygwin/mobaxterm/WSL /etc/profile.d
* install updated portable docker toolbox

download portabledevops to your home folder, 
```
cd ~ 
wget -qO portabledevops.sh 'https://raw.githubusercontent.com/robertluwang/portabledevops/master/portabledevops.sh'
chmod +x portabledevops.sh
wget -qO dockertoolbox.zip https://github.com/robertluwang/portabledevops/raw/master/dockertoolbox.zip
unzip dockertoolbox.zip
cp dockertoolbox/*  <PORTABLEPATH>/dockertoolbox
chmod +x <PORTABLEPATH>/dockertoolbox/*.exe
```
### 7.1 msys2/cygwin/mobaxterm
```
cp portabledevops.sh /etc/profile.d
```
### 7.2 WSL 
WSL installed on win10 so it is not portable, but we can integrate portable app from window10 to WSL cli using same tool.
Assumed the default portable folder is at C:\portabledevops, or you can change it in beginning of portabledevops.sh, 
```
export DEFPORTFOLDER=portabledevops
export DEFHOMEDRIVEL=c
```
then place to /etc/profile.d,
```
sudo cp portabledevops.sh /etc/profile.d
```
## 8 add cmder task   
```
msys64 :  set MSYS2_PATH_TYPE=inherit & cmd /c "%ConEmuDir%\..\..\..\msys64\usr\bin\bash --login -i"
cygwin64 :  cmd /c "%ConEmuDir%\..\..\..\cygwin64\bin\bash --login -i -new_console:C:"%ConEmuDir%\..\..\..\cygwin64\Cygwin.ico"
wsl: set "PATH=%ConEmuBaseDirShort%\wsl;%PATH%" & %ConEmuBaseDirShort%\conemu-cyg-64.exe --wsl -cur_console:pm:/mnt
``` 
