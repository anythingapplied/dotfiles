# Please run:
# curl -Lks https://raw.githubusercontent.com/anythingapplied/dotfiles/master/.config/setup/dotfiles.sh | /bin/bash
USER=anythingapplied
EMAIL=anythingjewish@gmail.com
REPO=git@github.com:$USER/dotfiles.git

set -e

# Find Git
if command -v git &> /dev/null
then
  echo "git found"
else
  echo "git not found. Installing git"
  sudo apt install git
fi

# Setup Key
ssh-keygen -t ed25519 -C "$EMAIL"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo "Go to https://github.com/settings/keys and enter:"
cat ~/.ssh/id_ed25519.pub
read -p "Press [Enter] key when complete"

# Checkout Dotfiles
git clone --bare $REPO $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
config checkout
if [ $? = 0 ]
then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
  mkdir -p .config-backup
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi
config checkout

# Configure Git
config config status.showUntrackedFiles no
config config --global user.name "$USER"
config config --global user.email $EMAIL
