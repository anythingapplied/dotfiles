set -e
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim python3-pip
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

# Nodejs 18
curl -sL https://deb.nodesource.com/setup_18.x -o ~/nodesource_setup.sh
sudo apt install gcc g++ make
sudo apt install nodejs
