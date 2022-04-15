echo Se intala curl como requisito previo
sudo apt-get install wget
sudo apt install curl

echo -------------- Se instalara nodejs 16, angular y firebase -------------------
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install nodejs
node -v

sudo npm install -g @angular/cli


sudo apt-get update


curl -sL https://firebase.tools | bash


echo ---------- Ya quedo ---------------
