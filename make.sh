#!/bin/sh

bash_profile=".profile"
bash_rc=".bashrc"
bash_profile_path="./dotfiles/.profile"
bash_rc_path="./dotfiles/.bashrc"
this=$(pwd)
old="old_dotfiles"

echo "Checking the Files in the Repository"

if [ $(find . -name $bash_rc) = $bash_rc_path ] && [ $(find . -name $bash_profile) = $bash_profile_path ]
then
	echo "Files Found"
else
	echo "Missing Files $bash_rc or $bash_profile"
fi

echo "Setting Up the Home Directory"

if [ -n "$(find $HOME -name .bashrc -o -name .bash_profile | head -n 2)" ];
then
	echo $this
	mkdir "$HOME/old_dotfiles"
	echo "$old Directory Made"
	cd "$this/dotfiles/"
	echo "Moving Existing Dotfiles to $old directory"
	mv $HOME/.bashrc $HOME/old_dotfiles/
	mv $HOME/.profile $HOME/old_dotfiles/
	echo "Files Moved"
	echo "Moving new dotfiles in the $HOME Directory"
	echo $this
	mv $bash_rc $HOME/
	mv $bash_profile $HOME/
	echo "Files Moved"
else
	echo "Files Not Moved"
fi

#Installing the Packages
./install.sh
