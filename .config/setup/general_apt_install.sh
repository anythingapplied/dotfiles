# Command Line Tools
sudo apt install \
  exa \
  bat \
  fd-find \
  fzf \
  zoxide \
  tmux \
  xclip \
  ripgrep \
  net-tools \
  tree \
  taskwarrior

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Applications
sudo apt install \
  keepassxc \
  kitty \
  libreoffice \
  gnome-tweaks

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
sudo apt install steam

# Chrome
wget -O ~/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo gdebi ~/google-chrome-stable_current_amd64.deb
rm ~/google-chrome-stable_current_amd64.deb

# Minecraft Launcher
wget https://files.multimc.org/downloads/multimc_1.6-1.deb
sudo gdebi multimc_1.6-1.deb
