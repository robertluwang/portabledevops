#!/bin/bash
# ve.sh activate replacement for virtualenv 
# By Robert Wang
# Aug 25, 2016
# Usage: place ve.sh to virtualenv project folder and source it
# $ source ve.sh 

export VIRTUAL_ENV=`pwd`
vename=`pwd | rev |cut -d/ -f1| rev`
export PATH="$VIRTUAL_ENV/Scripts:$PATH"
alias mypip="$VIRTUAL_ENV/Scripts/python $VIRTUAL_ENV/Scripts/pip.exe"
alias myipy="$VIRTUAL_ENV/Scripts/python $VIRTUAL_ENV/Scripts/ipython.exe"
alias mynb="$VIRTUAL_ENV/Scripts/python $VIRTUAL_ENV/Scripts/jupyter-notebook.exe"
alias myeasy="$VIRTUAL_ENV/Scripts/python $VIRTUAL_ENV/Scripts/easy_install.exe"
export PS1='($vename) \u> \w
$ '
