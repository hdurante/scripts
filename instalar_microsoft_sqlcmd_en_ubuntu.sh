sudo apt update
sudo install curl
#curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
#curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
#echo ------- Se indica orden para dar prioridad a repositorios de Microsoft y evitar conflictos con su software
#sudo touch /etc/apt/preferences.d/99microsoft-dotnet.pref
#sudo echo Package: * >> /etc/apt/preferences.d/99microsoft-dotnet.pref
#sudo echo Pin: origin "packages.microsoft.com" >> /etc/apt/preferences.d/99microsoft-dotnet.pref
#sudo echo Pin-Priority: 1001 >> /etc/apt/preferences.d/99microsoft-dotnet.pref
echo para Ubuntu 24.04
wget https://packages.microsoft.com/config/ubuntu/24.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get update 
sudo apt-get install unixodbc unixodbc-dev
sudo apt-get update 
sudo apt-get install mssql-tools
export PATH="$PATH:/opt/mssql-tools/bin/"

echo sqlcmd -S 127.0.0.1,1433 -U usuario -P clave -Q "use bd; Select top 10 * from tabla"
