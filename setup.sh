# Emacs
if [ -d ~/.emacs.d ]; then
	echo "~/.emacs.d already exists, skipping..."
else
	ln -s ~/dotfiles/emacs ~/.emacs.d
	echo "Created a symlink to ~/.emacs.d"
fi

# Fish
if [ -d ~/.config/fish ]; then
	echo "~/.config/fish already exists, skipping..."
else
	ln -s ~/dotfiles/fish ~/.config/fish
	echo "Created a symlink to ~/.config/fish"
fi

# Kitty
if [ -d ~/.config/kitty ]; then
	echo "~/.config/kitty already exists, skipping..."
else
	ln -s ~/dotfiles/kitty ~/.config/kitty
	echo "Created a symlink to ~/.config/kitty"
fi

# Neovim
if [ -d ~/.config/nvim ]; then
	echo "~/.config/nvim already exists, skipping..."
else
	ln -s ~/dotfiles/nvim ~/.config/nvim
	echo "Created a symlink to ~/.config/nvim"
fi

echo "Cleaning up..."
# rm ./setup.sh
