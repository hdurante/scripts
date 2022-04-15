
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update


sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io


sudo docker run hello-world

#-----------------------------------------------------------
sudo apt install apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add

echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" >> ~/kubernetes.list
sudo mv ~/kubernetes.list /etc/apt/sources.list.d

sudo apt update


sudo apt install kubelet
sudo apt install kubeadm
sudo apt install kubectl

sudo apt-get install -y kubernetes-cni
sudo apt-get install -y kubelet kubeadm kubectl kubernetes-cni

sudo systemctl enable docker
sudo systemctl daemon-reload
sudo systemctl restart docker
