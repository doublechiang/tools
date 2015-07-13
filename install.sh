#!/bin/bash

# install configuration file
CONFIGURATIONS="emacs gitconfig vimrc screenrc"
dir=`pwd`

for confile in $CONFIGURATIONS; do
   echo "installing $confile from this package..."

   # if previous file exist
   # prompt to erase it or not
   #    if not to remove it, then skip this confiuration file.
   # fi
   # create the symbolic link
   if [ -e ~/.${confile} ]; then

       echo "previous configuration file ${confile} exist"
       read -p "do you want to remove it, otherwise it will not be installed (y/n) " answer
       if [ $answer == "y" ]; then
	   rm ~/.${confile}
       else
	   continue
       fi
   fi
   ln -s ${dir}/$confile ~/.${confile}
done

