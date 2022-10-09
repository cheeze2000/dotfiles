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

echo "Cleaning up..."
# rm ./setup.sh
