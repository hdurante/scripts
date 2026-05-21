sudo apt update && sudo apt upgrade -y
sudo apt-get install ubuntu-desktop xrdp stacer -y
sudo cp /etc/iptables/rules.v4 /etc/iptables/rules.v4.bak && sudo truncate -s 0 /etc/iptables/rules.v4
sudo rm /usr/share/polkit-1/actions/org.freedesktop.color.policy
sudo passwd ubuntu      

sudo reboot
