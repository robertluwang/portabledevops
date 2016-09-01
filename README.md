# portabledevops

A portable devops shell env on windows, easy customization of cmder/console+git/msys.

## Background

[Cmder](https://github.com/cmderdev/cmder) is a software package created out of pure frustration over absence of usable console emulator on Windows. It is based on ConEmu. There are two version of cmder: cmder with own Git for Windows and cmdermini without git and bash. I used cmdermini with standalone latest Git for Windows instead of cmder with lower Git version.

[Console](https://sourceforge.net/projects/console/) is another lightweight windows console enhancement, supports multi-tabs.

[MSYS](http://www.mingw.org/wiki/MSYS) is a collection of GNU utilities such as bash, make, gawk and grep to allow building of applications and programs which depend on traditionally UNIX tools to be present. It is best lightweight *NIX shell on windows.

[git](https://git-for-windows.github.io/) the msys already replaced by Git for Windows. Git for Windows focuses on offering a lightweight, native set of tools that bring the full feature set of the Git SCM to Windows while providing appropriate user interfaces for experienced Git users and novices alike.

## What is portabledevops?

1. it is portable practice approach to integrate all portable devops tools into one portable folder running on usb or portable disk  
2. the portabledevops folder structure:    
`<drive>`:\portabledevops\  
`* productive tools`    
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
`* shell`     
cmdermini/             
console2/  
git/                              
`* dev tool`    
mingw/    
python/               
go/                                              
Lua/                                   
nodejs/                
R/                     
ruby23/                  
`* vm and docker tool`                                           
dockertoolbox/        
virtualbox/   

3. portabledevops config files list  
/etc/profile.d/portabledevops.sh   portable customization, including ENV, alias  
/etc/mypy2.sh                      customized setting for Python2  
/etc/mypy3.sh                      customized setting for Python3  
`<virtualenv_project>`/ve.sh         virtualenv activate replacement   
rev.c                              C source code for string reverse  
/usr/bin/rev                       binary for string reverse on windows  
README.md                          this file  

## How to setup portabledevops?

It is extremely easy, the idea is to place all portable customization in one place, and flexible to any window DOS replacement - shell terminal like cmder, console etc.
1) place the script portabledevops.sh to git/msys /etc/profile.d folder, will be sourced by etc/profile when launch bash with option  '--login -i'   
2) place mypy2.sh and mypy3.sh to git /etc/ folder  
3) place rev binary to git /usr/bin folder  
4) add cmder task   
`bash :  cmd /c "%ConEmuDir%\..\..\..\git\bin\bash --login -i"`  
5) add console tab  
`bash:  cmd /c "\portabledevops\git\bin\bash.exe --login -i"`   

