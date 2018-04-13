# hadoopInstall CentOS

sudo yum install -y git

git clone https://github.com/arthurepp/hadoopinstall.git

cd hadoopinstall/centos

chmod +x slave1.sh

./slave1.sh

Para o master execute os passoas adicionais

chmod +x master.sh

./master.sh
