# Kitty
if [ -d ~/.config/kitty ]; then
	echo "~/.config/kitty already exists, skipping..."
else
	ln -s ~/dotfiles/kitty ~/.config/kitty
	echo "Created a symlink to ~/.config/kitty"
fi

echo "Cleaning up..."
# rm ./setup.sh
