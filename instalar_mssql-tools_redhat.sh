sudo yum install unixODBC
sudo yum install unixODBC-devel
curl https://packages.microsoft.com/config/rhel/8/prod.repo | sudo tee /etc/yum.repos.d/mssql-release.repo
sudo yum install mssql-tools
