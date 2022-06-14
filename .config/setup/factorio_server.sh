set -e
# Docker Install
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Add Me as Docker User
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

useradd -m factorio --uid=845

# Factorio Image
sudo mkdir -p /opt/factorio
sudo chown 845:845 /opt/factorio
sudo docker run -d \
  -p 34197:34197/udp \
  -p 27015:27015/tcp \
  -v /opt/factorio:/factorio \
  --name factorio \
  --restart=always \
  factoriotools/factorio
docker stop factorio
cp -r ~/gdrive/factorio/server/saves /opt/factorio/
cp -r ~/gdrive/factorio/server/mods /opt/factorio/
cp ~/gdrive/factorio/server/config/server-settings.json /opt/factorio/config/
docker start factorio
