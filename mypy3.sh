#!/bin/bash

PYPATH=$PORTABLEPATH/python/Python34
export PATH=$PYPATH:$PYPATH/Scripts:$PATH
alias mypip="$PYPATH/python $PYPATH/Scripts/pip.exe"
alias myipy="$PYPATH/python $PYPATH/Scripts/ipython.exe"
alias mynb="$PYPATH/python $PYPATH/Scripts/jupyter-notebook.exe"
alias myeasy="$PYPATH/python $PYPATH/Scripts/easy_install.exe"
export PS1='(mypy3) \u> \w
$ '

