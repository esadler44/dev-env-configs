#!/opt/homebrew/bin/fish

echo "Installing dotfiles..."
cp -r ./.config/* ~/.config/

echo "Restarting window management..."
yabai --restart-service
skhd -r

echo "Fetching themes..."
mkdir downloads
git clone https://github.com/folke/tokyonight.nvim.git downloads

rm -rf downloads

echo "Applying themes..."
fish_config theme choose Tokyonight

echo "Make sure to install the following:"
echo "Set the iTerm2 color scheme to Tokyonight"

