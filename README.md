# portabledevops

A portable devops shell env on windows, easy customization of cmder/console+msys2/cygwin.

## Background

[Cmder](https://github.com/cmderdev/cmder) is a software package created out of pure frustration over absence of usable console emulator on Windows. It is based on ConEmu. There are two version of cmder: cmder with own Git for Windows and cmdermini without git and bash. I used cmdermini as lightweight xterm with bash/git from msys or cygwin.

[Console](https://sourceforge.net/projects/console/) is another lightweight windows console enhancement, supports multi-tabs.

[Cygwin](https://cygwin.com/) is a large collection of GNU and Open Source tools which provide functionality similar to a Linux distribution on Windows, also provides substantial POSIX API functionality.

[MSYS](http://www.mingw.org/wiki/MSYS) is a collection of GNU utilities such as bash, make, gawk and grep to allow building of applications and programs which depend on traditionally UNIX tools to be present. It is lightweight *NIX shell on windows. The [MSYS2](https://sourceforge.net/projects/msys2/?source=navbar) is an independent rewrite of MSYS, based on modern Cygwin (POSIX compatibility layer) and MinGW-w64 with the aim of better interoperability with native Windows software.

## What is portabledevops?

it is portable practice approach to integrate all portable devops tools into one portable folder running on usb or portable disk  
### the portabledevops folder structure:    
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

### portabledevops files list 
``` 
/etc/profile.d/portabledevops.sh - portable all-in-one customization setting for msys2/cygwin64  
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
3) install portable cmdermini/console and msys2/cygwin as below: 
```
L:\portabledevops\cmdermini    
L:\portabledevops\console2    
L:\portabledevops\msys64     
L:\portabledevops\cygwin64   
```
setup guide:  
cmdermini - unzip cmdermini from [cmder_mini.zip](https://github.com/cmderdev/cmder/releases)  
console2 - unzip console2 from [console2 zip](https://sourceforge.net/projects/console/)  
msys64 - ref [Portable msys64 setup](http://dreamcloud.artark.ca/portable-msys64-setup/)  
cygwin64 - ref [Portable cygwin64 setup](http://dreamcloud.artark.ca/portable-cygwin64-setup/)  

4) add cmder task   
```
msys2 :  cmd /c "%ConEmuDir%\..\..\..\msys64\bin\bash --login -i"
cygwin64 :  cmd /c "%ConEmuDir%\..\..\..\cygwin64\bin\bash --login -i"
``` 
5) add console tab  
```
msys2:  cmd /c "\portabledevops\msys64\bin\bash.exe --login -i"
cygwin64:  cmd /c "\portabledevops\cygwin64\bin\bash.exe --login -i"  
``` 
6) install all-in-one portabledevops profile script to msys2/cygwin  
open bash shell from cmder/console, 
```
cd ~
chmod 0700 .ssh/id_rsa
rm -r ~/portabledevops
git clone git@github.com:robertluwang/portabledevops.git
cd portabledevops
# place the script portabledevops.sh to msys2/cygwin64 /etc/profile.d folder, will be sourced by /etc/profile when launch bash with option  '--login -i'   
dos2unix portabledevops.sh
cp portabledevops.sh /etc/profile.d/ 
# install docker toolbox locally
unzip dockertoolbox.zip
mkdir -p /usr/local/bin
cp dockertoolbox/docker*.exe /usr/local/bin/
chmod +x /usr/local/bin/docker*.exe
```
or run deploy script as below: 
```
cd ~
wget https://github.com/robertluwang/portabledevops/blob/master/setup.sh
dos2unix setup.sh
./setup.sh
```

