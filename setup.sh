#!/bin/bash

# vimrc setup
echo "Setting up vim: "
if [ ! -f ~/.vimrc ]; then
	ln -s ~/env/vim/.vimrc ~/.vimrc
	echo "Created a symbolic link for .vimrc"
else
	echo " .vimrc already exists"
	echo -n "Do you want to overwrite the file? (y/n): "
	read input
	if [ "$input" == "y" ]; then
		rm ~/.vimrc
		ln -s ~/env/vim/.vimrc ~/.vimrc
		echo "Created a symbolic link for .vimrc"
	fi
fi

# tmux config file setup
echo -e "\nSetting up tmux: "
if [ ! -f ~/.tmux.conf ]; then
	ln -s ~/env/tmux/.tmux.conf ~/.tmux.conf
	echo "Created a symbolic link for .tmux.conf"
else
	echo " .tmux.conf already exists"
	echo -n "Do you want to overwrite the file? (y/n): "
	read input
	if [ "$input" == "y" ]; then
		rm ~/.tmux.conf
		ln -s ~/env/tmux/.tmux.conf ~/.tmux.conf
		echo "Created a symbolic link for .tmux.conf"
	fi
fi
