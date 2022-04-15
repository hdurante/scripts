echo Se intala curl como requisito previo
sudo apt-get install wget
sudo apt install curl

echo -------------- Se instalara nodejs 16, docker y firebase -------------------
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install nodejs
node -v

sudo npm install -g @angular/cli


sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update


sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


sudo apt-get update


curl -sL https://firebase.tools | bash


echo ---------- Ya quedo ---------------
