echo Se intala curl como requisito previo
sudo apt-get install wget
sudo apt install curl

echo -------------- Se instalara nodejs 18, angular y firebase -------------------
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install nodejs
node -v

sudo npm install -g @angular/cli@14.2.10


sudo apt-get update


curl -sL https://firebase.tools | bash


echo ---------- Ya quedo ---------------
