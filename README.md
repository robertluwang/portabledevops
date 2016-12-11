# portabledevops

A portable devops tool set on windows, easy customization of cmder/console+msys2/cygwin.

## Background

[Cmder](https://github.com/cmderdev/cmder) is a software package created out of pure frustration over absence of usable console emulator on Windows. It is based on ConEmu. There are two version of cmder: cmder with own Git for Windows and cmdermini without git and bash. I used cmdermini as lightweight xterm with bash/git from msys or cygwin.

[Console](https://sourceforge.net/projects/console/) is another lightweight windows console enhancement, supports multi-tabs.

[Cygwin](https://cygwin.com/) is a large collection of GNU and Open Source tools which provide functionality similar to a Linux distribution on Windows, also provides substantial POSIX API functionality.

[MSYS](http://www.mingw.org/wiki/MSYS) is a collection of GNU utilities such as bash, make, gawk and grep to allow building of applications and programs which depend on traditionally UNIX tools to be present. It is lightweight *NIX shell on windows. The [MSYS2](https://sourceforge.net/projects/msys2/?source=navbar) is an independent rewrite of MSYS, based on modern Cygwin (POSIX compatibility layer) and MinGW-w64 with the aim of better interoperability with native Windows software.

## What is portabledevops?
it is portable practice approach to integrate all portable devops tools into one portable folder running on usb or portable disk 

## portabledevops folder structure:    
&lt;drive&gt;:\portabledevops\  
\* productive tools      
```
qdir/   
7z/   
filezilla/   
scite/                 
sublimetext3/  
calibre/  
kitty/  
putty/  
greenshot/             
imgburn/  
freecommander/  
brackets/ 
```
\* nix 
```
cygwin64/ 
msys64/
```
\* shell 
```
cmdermini/             
console2/
```
\* dev tool
```    
python/               
go/                                              
Lua/                                   
nodejs/                
R/                     
ruby23/
```
\* vm and docker tool
```
dockertoolbox/        
vagrant/  
```

## portabledevops files list 
``` 
portabledevops.sh - portable all-in-one customization setting for msys2/cygwin64  
setup.sh - portabledevops deploy script
dockertoolbox.zip - collection of portable docker toolbox win binary files
README.md - this file   
```

## How to setup portabledevops?

It is pretty easy, the idea is to place all portable customization in one place, and flexible to any window DOS replacement - shell terminal like cmder, console etc. 
1) create portabledevops root folder on USB drive, for example: 
```
L:\portabledevops
```

2) make junction (directory hard link) for “Program Files”, it will make easy to find VirtualBox tools 
from cmd.exe 
```
mklink /j  C:\Program_Files  "C:\Program Files"
Junction created for C:\Program_Files <<===>> C:\Program Files
mklink /j  C:\Program_Files_x86 "C:\Program Files (x86)"
Junction created for C:\Program_Files_x86 <<===>> C:\Program Files (x86)
```

3) install portable shell  
L:\portabledevops\cmdermini  # unzip cmdermini from [cmder_mini.zip](https://github.com/cmderdev/cmder/releases)  
L:\portabledevops\console2   # unzip console2 from [console2 zip](https://sourceforge.net/projects/console/)   

4) install portable msys2 
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

5) install portable cygwin64 
- download cygwin64 from [https://www.cygwin.com/setup-x86_64.exe](https://www.cygwin.com/setup-x86_64.exe)
- move setup-x86_64.exe to L:\portabledevops\cygdev64 folder
- click setup-x86_64.exe
only install wget, choice install folder and package folder to L:\portabledevops\cygdev64,it will install cygwin 64 core package. 
- click Cygwin.bat to launch cygwin bash shell
- install apt-cyg
```
wget raw.github.com/transcode-open/apt-cyg/master/apt-cyg
chmod +x apt-cyg
mv apt-cyg /usr/local/bin
which -a apt-cyg
```
- install git, python-devel, gcc-g++, curl, dos2unix, zip, unzip 
```
apt-cyg install git python-devel curl dos2unix zip unzip
```
- install pip
```
wget -qO- 'https://bootstrap.pypa.io/get-pip.py' | python2
```

6) add cmder task   
```
msys2 :  cmd /c "%ConEmuDir%\..\..\..\msys64\bin\bash --login -i"
cygwin64 :  cmd /c "%ConEmuDir%\..\..\..\cygwin64\bin\bash --login -i"
``` 
7) add console tab  
```
msys2:  cmd /c "\portabledevops\msys64\bin\bash.exe --login -i"
cygwin64:  cmd /c "\portabledevops\cygwin64\bin\bash.exe --login -i"  
``` 
8) deploy portabledevops using setup.sh script    
open bash shell from cmder/console, 
```
cd ~ ; wget -qO- 'https://raw.githubusercontent.com/robertluwang/portabledevops/master/setup.sh' | sh
```

