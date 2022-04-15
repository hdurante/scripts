
sudo apt-get update


sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose


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

sudo swapoff -a
sudo nano /etc/fstab
sudo hostnamectl set-hostname kubernetes-master

sudo hostnamectl set-hostname kubernetes-worker
lsmod | grep br_netfilter
sudo modprobe br_netfilter

sudo sysctl net.bridge.bridge-nf-call-iptables=1
