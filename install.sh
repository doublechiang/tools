#!/bin/bash

# install configuration file
CONFIGURATIONS="emacs vimrc screenrc inputrc"
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


# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Add the directory to PATH in .bashrc if it's not already present
if ! grep -q "$SCRIPT_DIR" ~/.bashrc; then
    echo "export PATH=\"$SCRIPT_DIR:\$PATH\"" >> ~/.bashrc
    echo "Path added to .bashrc"
else
    echo "Path already exists in .bashrc"
fi


#!/bin/bash

# Check if Git is installed
if command -v git &> /dev/null; then
    echo "Git is installed."

    # Set up a Git alias (for example, setting 'co' as an alias for 'checkout')
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.ci commit
    git config --global alias.st status

    echo "Git aliases set up:"
    echo "  co -> checkout"
    echo "  br -> branch"
    echo "  ci -> commit"
    echo "  st -> status"
else
    echo "Git is not installed. Please install Git to use this script."
fi


# Reload .bashrc to apply changes
source ~/.bashrc

