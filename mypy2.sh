#!/bin/bash
# portabledevops customized setting for portable python
# By Robert Wang
# Aug 21, 2016
# Usage:  place mypy2.sh to git /etc folder

# $PORTABLEPATH exported by /etc/profile.d/portabledevops.sh
# all portable python versions under $PORTABLEPATH/python, need to manually setting here
PYPATH=$PORTABLEPATH/python/Python27

export PATH=$PYPATH:$PYPATH/Scripts:$PATH
alias mypip="$PYPATH/python $PYPATH/Scripts/pip.exe"
alias myipy="$PYPATH/python $PYPATH/Scripts/ipython.exe"
alias mynb="$PYPATH/python $PYPATH/Scripts/jupyter-notebook.exe"
alias myeasy="$PYPATH/python $PYPATH/Scripts/easy_install.exe"
export PS1='(mypy27) \u> \w
$ '

