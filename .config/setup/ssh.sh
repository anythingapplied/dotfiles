set -e

sudo apt update
sudo apt install openssh-server
sudo systemctl status ssh
sudo ufw allow ssh
