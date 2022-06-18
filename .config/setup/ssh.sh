set -e

sudo apt update
sudo apt install --install-suggests openssh-server
sudo systemctl status ssh
sudo ufw allow ssh
