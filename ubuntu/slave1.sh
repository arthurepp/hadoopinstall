#!/bin/bash

sudo cp templates/hosts /etc/hosts

sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade && sudo apt-get -y install openjdk-8-jdk-headless && sudo apt-get -y install openssh-server

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
echo 'export PATH=$PATH:$HIVE_HOME/bin' >> ~/.bashrc
echo 'export SQOOP_HOME="/usr/local/hadoop/sqoop"' >> ~/.bashrc
echo 'export PATH=$PATH:$SQOOP_HOME/bin' >> ~/.bashrc
echo 'export SPARK_HOME="/usr/local/hadoop/spark"' >> ~/.bashrc
echo 'export PATH=$PATH:$SPARK_HOME/bin' >> ~/.bashrc
echo 'export YARN_CONF_DIR="/usr/local/hadoop/etc/hadoop"' >> ~/.bashrc
sudo mkdir /usr/local/hadoop
sudo chown -R hadoop:hadoop /usr/local/hadoop
