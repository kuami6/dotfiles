#! /bin/bash


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# create folders 
mkdir -p ~/downloads
mkdir -p ~/bin
mkdir -p ~/.config

# check if zsh is installed
if [[ $(cat /etc/shells | grep zsh -c) == 0 ]] 
then 
	echo "zsh not installed, system incompatible with config"
	exit
fi
# check if shell is zsh, if it is not promt user and quit, 
if [[ $(getent passwd | grep $USER | awk -F ":" '{print $7}' | grep zsh -c) == 0  ]]
then
	echo "shell not set to zsh, system incompatible with config"
	exit
fi
# check if oh-my-zsh is installed, if not run the install script
if [ -z "${ZSH}" ]
then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	echo "oh-my-zsh installed, skipping"
fi

# check if a symlink for zshrc exists
if ! [ -L ~/.zshrc ]; then
	# delete and symlink
	if [ -f ~/.zshrc ]; then 
		echo "zshrc exists, deleting"
		rm ~/.zshrc 
		echo "deleted, symlinking from dotfiles repo"
		cd ~; ln -s $SCRIPT_DIR/.zshrc .zshrc
	# symlink if no exists
	else
		echo "zshrc does not exist, symlinking"
		cd ~; ln -s $SCRIPT_DIR/.zshrc .zshrc
	fi 
else
	echo "zsh already symlinked to dotfiles repo, skipping"
fi

# create local-zshrc for all our local config
if ! [ -f ~/.local-zshrc.sh ]; then
	echo "creating local-zshrc"
	touch ~/.local-zshrc.sh
else
	echo "local-zshrc already exists, skipping"
fi

# symlink tmux conf
if ! [ -L ~/.tmux.conf ]; then
	# delete and symlink
	if [ -f ~/.tmux.conf ]; then 
		echo "tmux conf exists, deleting"
		rm ~/.tmux.conf
		echo "deleted, symlinking from dotfiles repo"
		cd ~; ln -s $SCRIPT_DIR/.tmux.conf .tmux.conf
	# symlink if no exists
	else
		echo "tmux conf does not exist, symlinking"
		cd ~; ln -s $SCRIPT_DIR/.tmux.conf .tmux.conf
	fi 
else
	echo "tmux conf already symlinked to dotfiles repo, skipping"
fi

# call nvim script
./install-nvim.sh

# symlink nvim config
if ! [ -L ~/.config/nvim ]; then
	if [ -f ~/.config/nvim ]; then
		echo "nvim config exists, deleting"
		rm -r ~/.config/nvim
		echo "deleted, symlinking from dotfiles repo"
		cd ~/.config; ln -s $SCRIPT_DIR/nvim nvim
		
	else
		echo "nvim config does not exist, symlinking"
		cd ~/.config/
		cd ~/.config; ln -s $SCRIPT_DIR/nvim nvim
	fi
else
	echo "nvim conf already symlinked to dotfiles repo, skipping"
fi

