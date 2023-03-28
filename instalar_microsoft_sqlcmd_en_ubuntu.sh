sudo apt update
sudo install curl
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
sudo apt-get update 
sudo apt-get install mssql-tools unixodbc-dev
sudo apt-get update 
sudo apt-get install mssql-tools
export PATH="$PATH:/opt/mssql-tools/bin/"

echo sqlcmd -S 127.0.0.1,1433 -U usuario -P clave -Q "use bd; Select top 10 * from tabla"
