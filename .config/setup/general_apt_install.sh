set -e
# Command Line Tools
sudo apt install \
  exa \
  fd-find \
  fzf \
  zoxide \
  tmux \
  tmux-plugin-manager \
  xclip \
  ripgrep

# Applications
sudo apt install \
  keepassxc \
  kitty \
  libreoffice \
  google-chrome-stable

# Programming
sudo apt install \
  python3-neovim \
  python3-pip \
  python-is-python3

# Discord
sudo apt install gdebi-core wget
wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo gdebi ~/discord.deb
rm ~/discord.deb

# Games
sudo add-apt-repository multiverse
sudo apt update
sudo apt install multimc
sudo apt install steam
