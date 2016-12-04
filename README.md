# portabledevops

A portable devops shell env on windows, easy customization of cmder/console+cygwin/msys.

## Background

[Cmder](https://github.com/cmderdev/cmder) is a software package created out of pure frustration over absence of usable console emulator on Windows. It is based on ConEmu. There are two version of cmder: cmder with own Git for Windows and cmdermini without git and bash. I used cmdermini with standalone latest Git for Windows instead of cmder with lower Git version.

[Console](https://sourceforge.net/projects/console/) is another lightweight windows console enhancement, supports multi-tabs.

[Cygwin](https://cygwin.com/) is a large collection of GNU and Open Source tools which provide functionality similar to a Linux distribution on Windows, also provides substantial POSIX API functionality.

[MSYS](http://www.mingw.org/wiki/MSYS) is a collection of GNU utilities such as bash, make, gawk and grep to allow building of applications and programs which depend on traditionally UNIX tools to be present. It is best lightweight *NIX shell on windows. The [MSYS2](https://sourceforge.net/projects/msys2/?source=navbar) is an independent rewrite of MSYS, based on modern Cygwin (POSIX compatibility layer) and MinGW-w64 with the aim of better interoperability with native Windows software.

[git](https://git-for-windows.github.io/) the msys already replaced by Git for Windows. Git for Windows focuses on offering a lightweight, native set of tools that bring the full feature set of the Git SCM to Windows while providing appropriate user interfaces for experienced Git users and novices alike.

## What is portabledevops?

it is portable practice approach to integrate all portable devops tools into one portable folder running on usb or portable disk  
### the portabledevops folder structure:    
&lt;drive&gt;:\portabledevops\  
\* productive tools      
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
\* nix
cygwin64/
msys2/
\* shell      
cmdermini/             
console2/                               
\* dev tool    
mingw64/    
python/               
go/                                              
Lua/                                   
nodejs/                
R/                     
ruby23/                  
\* vm and docker tool                                             
dockertoolbox/        
vagrant/  

### portabledevops config files list  
/etc/profile.d/portabledevops_cygwin.sh - portable customization setting for cygwin64
/etc/profile.d/portabledevops_msys.sh - portable customization setting for msys2
rev.c - C source code for string reverse  
/usr/bin/rev - binary for string reverse on windows  
README.md - this file  

## How to setup portabledevops?

It is extremely easy, the idea is to place all portable customization in one place, and flexible to any window DOS replacement - shell terminal like cmder, console etc.  
1) place the script portabledevops_xxx.sh to cygwin/msys2 /etc/profile.d folder, will be sourced by etc/profile when launch bash with option  '--login -i'   
2) add cmder task   
`bash :  cmd /c "%ConEmuDir%\..\..\..\cygwin64\bin\bash --login -i"`  
`bash :  cmd /c "%ConEmuDir%\..\..\..\msys2\bin\bash --login -i"`  
4) add console tab  
`bash:  cmd /c "\portabledevops\cygwin64\bin\bash.exe --login -i"`  
`bash:  cmd /c "\portabledevops\msys2\bin\bash.exe --login -i"`  