#!/bin/sh

if [ "${1#/}" = "$1" ]; 
then
	f=`pwd`/$1;
else 
	f=$1;
fi; 

cd /usr/share/nupdf
./nupdf.bin "$f"
