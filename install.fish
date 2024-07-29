#!/opt/homebrew/bin/fish

echo "Installing dotfiles..."
rm -r ~/.config/yabai
rm -r ~/.config/skhd
rm -r ~/.config/sketchybar
cp -r ./.config/* ~/.config/

echo "Restarting window management..."
yabai --restart-service
skhd -r
sketchybar --reload

echo "Fetching Tokyonight theme..."
mkdir downloads
git clone https://github.com/folke/tokyonight.nvim.git downloads
cp downloads/extras/fish_themes/tokyonight_night.theme ~/.config/fish/themes/Tokyonight_Night.theme
cp downloads/extras/iterm/tokyonight_night.itermcolors ./Tokyonight\ Night.itermcolors
rm -rf downloads

echo "Applying Tokyonight theme..."
fish_config theme choose Tokyonight_Night
yes | fish_config theme save

echo "Make sure to setup the folloing manually:"
echo "Set the iTerm2 color scheme to Tokyonight Night as well"
echo "Go to Profiles > Colors > Color Presets > Import... and select the Tokyonight Night.itermcolors file"
echo "Then set the preset to Tokyonight Night"
echo "Go to the Window tab and set the Transparency to 40%"
echo "Keep background colors opaque"
echo "Blur on, Radius 25"
echo "Style: No Title Bar"
