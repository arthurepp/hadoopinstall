#!/bin/bash

sudo cp templates/hosts /etc/hosts

sudo yum check-update
sudo yum -y update
sudo yum -y install java-1.8.0-openjdk-devel openssh sshpass

#JAVA
echo 'export JAVA_HOME="/usr/lib/jvm/java-openjdk/"' >> ~/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc;
#HADOOP
echo 'export HADOOP_INSTALL="/usr/local/hadoop"' >> ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_INSTALL/lib' >> ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_INSTALL/slib' >> ~/.bashrc
echo 'export HADOOP_MAPRED_HOME=$HADOOP_INSTALL' >> ~/.bashrc
echo 'export HADOOP_COMMON_HOME=$HADOOP_INSTALL' >> ~/.bashrc
echo 'export HADOOP_HDFS_HOME=$HADOOP_INSTALL' >> ~/.bashrc
echo 'export YARN_HOME=$HADOOP_INSTALL' >> ~/.bashrc
echo 'export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_INSTALL/lib/native' >> ~/.bashrc
echo 'export HADOOP_OPTS="-Djava.library.path=$HADOOP_INSTALL/lib/native"' >> ~/.bashrc
echo 'export HADOOP_HOME=/usr/local/hadoop' >> ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin' >> ~/.bashrc
#HIVE
echo 'export HIVE_HOME="/usr/local/hadoop/hive"' >> ~/.bashrc
echo 'export PATH=$PATH:$HIVE_HOME/bin' >> ~/.bashrc
#SQOOP
echo 'export SQOOP_HOME="/usr/local/hadoop/sqoop"' >> ~/.bashrc
echo 'export PATH=$PATH:$SQOOP_HOME/bin' >> ~/.bashrc
#SPARK
echo 'export SPARK_HOME="/usr/local/hadoop/spark"' >> ~/.bashrc
echo 'export PATH=$PATH:$SPARK_HOME/bin' >> ~/.bashrc
echo 'export YARN_CONF_DIR="/usr/local/hadoop/etc/hadoop"' >> ~/.bashrc

sudo mkdir /usr/local/hadoop
sudo chown -R hadoop:hadoop /usr/local/hadoop
sudo systemctl disable firewalld
