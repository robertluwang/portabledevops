#!/bin/bash

PYPATH=/$HOMEDRIVEL/portabledevops/Python27
export PATH=$PYPATH:$PYPATH/Scripts:$PATH
alias mypip="$PYPATH/python $PYPATH/Scripts/pip.exe"
alias myipy="$PYPATH/python $PYPATH/Scripts/ipython.exe"
alias mynb="$PYPATH/python $PYPATH/Scripts/jupyter-notebook.exe"
alias myeasy="$PYPATH/python $PYPATH/Scripts/easy_install.exe"
export PS1='(mypy27) \u> \w
$ '

