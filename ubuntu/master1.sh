#!/bin/bash

sudo cp templates/hosts /etc/hosts

sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade && sudo apt-get install -y mariadb-server && sudo apt-get -y install openjdk-8-jdk-headless && sudo apt-get -y install openssh-server

echo 'export HADOOP_INSTALL="/usr/local/hadoop"' >> ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_INSTALL/lib' >> ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_INSTALL/slib' >> ~/.bashrc
echo 'export HADOOP_MAPRED_HOME=$HADOOP_INSTALL' >> ~/.bashrc
echo 'export HADOOP_COMMON_HOME=$HADOOP_INSTALL' >> ~/.bashrc
echo 'export HADOOP_HDFS_HOME=$HADOOP_INSTALL' >> ~/.bashrc
echo 'export YARN_HOME=$HADOOP_INSTALL' >> ~/.bashrc
echo 'export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_INSTALL/lib/native' >> ~/.bashrc
echo 'export HADOOP_OPTS="-Djava.library.path=$HADOOP_INSTALL/lib/native"' >> ~/.bashrc
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.bashrc;
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc;
sudo sh -c -e "echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> /etc/environment";
echo 'export HADOOP_HOME=/usr/local/hadoop' >> ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin' >> ~/.bashrc

echo 'export HIVE_HOME="/usr/local/hadoop/hive"' >> ~/.bashrc
echo 'export PATH=$PATH:$HIVE_HOME/bin' >> ~/.bashrc
echo 'export SQOOP_HOME="/usr/local/hadoop/sqoop"' >> ~/.bashrc
echo 'export PATH=$PATH:$SQOOP_HOME/bin' >> ~/.bashrc
echo 'export SPARK_HOME="/usr/local/hadoop/spark"' >> ~/.bashrc
echo 'export PATH=$PATH:$SPARK_HOME/bin' >> ~/.bashrc
echo 'export YARN_CONF_DIR="/usr/local/hadoop/etc/hadoop"' >> ~/.bashrc

sudo mkdir /install
sudo wget -O /install/hadoop-3.3.1.tar.gz  "http://ftp.unicamp.br/pub/apache/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz"
sudo wget -O /install/apache-hive-3.1.2-bin.tar.gz  "https://dlcdn.apache.org/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz"
sudo wget -O /install/sqoop-1.4.7.tar.gz  "http://archive.apache.org/dist/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz"
sudo wget -O /install/spark-3.2.0-bin-hadoop2.7.tgz  "http://ftp.unicamp.br/pub/apache/spark/spark-3.2.0/spark-3.2.0-bin-hadoop3.2.tgz"
sudo wget -O /install/mysql-connector-java-5.1.47.tar.gz  "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.47.tar.gz"
sudo wget -O /install/zeppelin-0.10.0-bin-all.tgz  "http://ftp.unicamp.br/pub/apache/zeppelin/zeppelin-0.10.0/zeppelin-0.10.0-bin-all.tgz"

sudo mkdir -p /usr/local/hadoop
sudo mkdir -p /usr/local/hadoop/logs
sudo mkdir -p /usr/local/hadoop/tmp
sudo mkdir -p /usr/local/hadoop/hdfs/namenode
sudo mkdir -p /usr/local/hadoop/hdfs/datanode
sudo mkdir -p /usr/local/hadoop/hive
sudo mkdir -p /usr/local/hadoop/hive/iotmp
sudo mkdir -p /usr/local/hadoop/sqoop
sudo mkdir -p /usr/local/hadoop/spark
sudo mkdir -p /usr/local/hadoop/zeppelin

sudo chown -R hadoop:hadoop /usr/local/hadoop

sudo tar -xzvf /install/hadoop-3.3.1.tar.gz -C /usr/local/hadoop --strip-components=1
sudo tar -xzvf /install/apache-hive-3.1.2-bin.tar.gz -C /usr/local/hadoop/hive --strip-components=1
sudo tar -xzvf /install/sqoop-1.4.7.tar.gz -C /usr/local/hadoop/sqoop --strip-components=1
sudo tar -xzvf /install/spark-3.2.0-bin-hadoop2.7.tgz -C /usr/local/hadoop/spark --strip-components=1
sudo tar -xzvf /install/mysql-connector-java-5.1.47.tar.gz -C /install/
sudo tar -xzvf /install/zeppelin-0.10.0-bin-all.tgz -C /usr/local/hadoop/zeppelin --strip-components=1

sudo cp templates/hive-site.xml /usr/local/hadoop/hive/conf/hive-site.xml
sudo cp templates/core-site.xml /usr/local/hadoop/etc/hadoop/core-site.xml
sudo cp templates/hdfs-site.xml /usr/local/hadoop/etc/hadoop/hdfs-site.xml
sudo cp templates/mapred-site.xml /usr/local/hadoop/etc/hadoop/mapred-site.xml
sudo cp templates/yarn-site.xml /usr/local/hadoop/etc/hadoop/yarn-site.xml
sudo cp templates/masters /usr/local/hadoop/etc/hadoop/masters
sudo cp templates/slaves /usr/local/hadoop/etc/hadoop/slaves
sudo cp templates/slaves /usr/local/hadoop/spark/conf/slaves
sudo cp /usr/local/hadoop/hive/conf/hive-site.xml /usr/local/hadoop/spark/conf/

sudo cp /install/mysql-connector-java-5.1.47/mysql-connector-java-5.1.47-bin.jar /usr/local/hadoop/hive/lib/
sudo cp /install/mysql-connector-java-5.1.47/mysql-connector-java-5.1.47-bin.jar /usr/local/hadoop/sqoop/lib/

sudo sh -c -e "echo 'export HADOOP_PREFIX=/usr/local/hadoop' >> /usr/local/hadoop/etc/hadoop/hadoop-env.sh";

#MARIADB
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql_secure_installation
sudo mysql -u root <<EOF
create database hivemain;
create user hive identified by 'hive';
GRANT ALL PRIVILEGES ON hivemain.* TO 'hive'@'%' IDENTIFIED BY 'hive';
use hivemain;
source /usr/local/hadoop/hive/scripts/metastore/upgrade/mysql/hive-schema-3.1.0.mysql.sql;
EOF

sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
