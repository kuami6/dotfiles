#! /bin/bash

## installs version 0.9.5 of nvim into /home/$user/bin
nvim_version="v0.9.5"
nvim_tarball="https://github.com/neovim/neovim/releases/download/$nvim_version/nvim-linux64.tar.gz"

install_nvim() {
	# download and extract
	mkdir -p ~/downloads
	cd -p ~/downloads
	rm ~/downloads/nvim-linux64.tar.gz
	wget $nvim_tarball	
	tar -xzf ~/downloads/nvim-linux64.tar.gz
	
	#symlink to bin
	mkdir ~/bin
	cd ~/bin
	ln -s ../downloads/nvim-linux64/bin/nvim nvim
}

# check if nvim is installed

if [[ $(type -p nvim) ]]; then
	echo "nvim is installed, skipping"
else
	#install nvim
	install_nvim
fi

echo "make sure a c compiler is installed on the system or treesitter will throw errors"

