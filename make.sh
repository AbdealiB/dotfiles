#!/bin/sh

bash_profile=".profile"
bash_rc=".bashrc"
bash_profile_path="./dotfiles/.profile"
bash_rc_path="./dotfiles/.bashrc"
this=$(pwd)
old="old_dotfiles"

echo "Finding the files"

if [ $(find . -name $bash_rc) = $bash_rc_path ] && [ $(find . -name $bash_profile) = $bash_profile_path ]
then
	echo "It is present"
else
	echo "It is not present"
fi

echo "Finding Home Directory"

if [ -n "$(find $HOME -name .bashrc -o -name .bash_profile | head -n 2)" ];
then
	echo $this
	mkdir "$HOME/old_dotfiles"
	echo "old_dotfiles Directory Made"
	cd "$this/dotfiles/"
	echo "Moving Existing Dotfiles to $old directory"
#	mv $HOME/.bashrc $HOME/old_dotfiles/
#	mv $HOME/.profile $HOME/old_dotfiles/
	echo "Files Moved"
	echo "Moving new dotfiles in the $HOME Directory"
	echo $this
	cp $bash_rc $HOME/
	cp $bash_profile $HOME/
	echo "Files Moved"

else
	echo "It is Not there"
fi
