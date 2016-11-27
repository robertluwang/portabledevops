#!/usr/bin/bash
# name: jupykernel.sh
# install ipython kernel for both python2/3 and move to user location ~/.ipython/kernels
# usage: source jupykernel.sh
# Nov 27, 2016
# Robert Wang

# install ipython kernel to default C:\ProgramData\jupyter\kernels
# alias ipy2='/L/portabledevops/python/Python27/python /L/portabledevops/python/Python27/Scripts/ipython.exe'
# alias ipy3='/L/portabledevops/python/Python34/python /L/portabledevops/python/Python34/Scripts/ipython.exe'

ipy2 kernel install > /dev/null
ipy3 kernel install > /dev/null

if [ ! -d /home/$USERNAME/.ipython/kernels ]; then
	mkdir -p /home/$USERNAME/.ipython/kernels
fi

if [ -d /home/$USERNAME/.ipython/kernels/python2 ];then
    rm -r /home/$USERNAME/.ipython/kernels/python2
fi 

if [ -d /home/$USERNAME/.ipython/kernels/python3 ];then
    rm -r /home/$USERNAME/.ipython/kernels/python3
fi 

mv /c/ProgramData/jupyter/kernels/python2 /home/$USERNAME/.ipython/kernels
mv /c/ProgramData/jupyter/kernels/python3 /home/$USERNAME/.ipython/kernels

echo "installed ipython kernels to location: /home/$USERNAME/.ipython/kernels"
ls -ltr /home/$USERNAME/.ipython/kernels/python*