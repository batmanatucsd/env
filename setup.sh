#!/bin/bash

# vimrc setup
echo "Setting up vim"
cp ./vim/colors/* ~/.vim/colors/ # copying colors
echo "Copied vim colors"

# install Vundle.vim
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo "im here"
fi

# link .vimrc
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

# tmux setup
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
