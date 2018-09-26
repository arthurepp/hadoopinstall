#!/bin/bash

ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

ssh-copy-id -i ~/.ssh/id_rsa.pub hadoop@hadoop-master
ssh-copy-id -i ~/.ssh/id_rsa.pub hadoop@hadoop-slave1
ssh-copy-id -i ~/.ssh/id_rsa.pub hadoop@hadoop-slave2
ssh-copy-id -i ~/.ssh/id_rsa.pub hadoop@hadoop-slave3

sudo chmod 0600 ~/.ssh/authorized_keys

scp -r /usr/local/hadoop/bin hadoop@hadoop-slave1:/usr/local/hadoop
scp -r /usr/local/hadoop/sbin hadoop@hadoop-slave1:/usr/local/hadoop
scp -r /usr/local/hadoop/hdfs hadoop@hadoop-slave1:/usr/local/hadoop
scp -r /usr/local/hadoop/include hadoop@hadoop-slave1:/usr/local/hadoop
scp -r /usr/local/hadoop/libexec hadoop@hadoop-slave1:/usr/local/hadoop
scp -r /usr/local/hadoop/logs hadoop@hadoop-slave1:/usr/local/hadoop
scp -r /usr/local/hadoop/share hadoop@hadoop-slave1:/usr/local/hadoop
scp -r /usr/local/hadoop/etc hadoop@hadoop-slave1:/usr/local/hadoop
scp -r /usr/local/hadoop/lib hadoop@hadoop-slave1:/usr/local/hadoop
scp -r /usr/local/hadoop/slib hadoop@hadoop-slave1:/usr/local/hadoop
scp -r /usr/local/hadoop/spark hadoop@hadoop-slave1:/usr/local/hadoop
scp -r /usr/local/hadoop/tmp hadoop@hadoop-slave1:/usr/local/hadoop

scp -r /usr/local/hadoop/bin hadoop@hadoop-slave2:/usr/local/hadoop
scp -r /usr/local/hadoop/sbin hadoop@hadoop-slave2:/usr/local/hadoop
scp -r /usr/local/hadoop/hdfs hadoop@hadoop-slave2:/usr/local/hadoop
scp -r /usr/local/hadoop/include hadoop@hadoop-slave2:/usr/local/hadoop
scp -r /usr/local/hadoop/libexec hadoop@hadoop-slave2:/usr/local/hadoop
scp -r /usr/local/hadoop/logs hadoop@hadoop-slave2:/usr/local/hadoop
scp -r /usr/local/hadoop/share hadoop@hadoop-slave2:/usr/local/hadoop
scp -r /usr/local/hadoop/etc hadoop@hadoop-slave2:/usr/local/hadoop
scp -r /usr/local/hadoop/lib hadoop@hadoop-slave2:/usr/local/hadoop
scp -r /usr/local/hadoop/slib hadoop@hadoop-slave2:/usr/local/hadoop
scp -r /usr/local/hadoop/spark hadoop@hadoop-slave2:/usr/local/hadoop
scp -r /usr/local/hadoop/tmp hadoop@hadoop-slave2:/usr/local/hadoop

scp -r /usr/local/hadoop/bin hadoop@hadoop-slave3:/usr/local/hadoop
scp -r /usr/local/hadoop/sbin hadoop@hadoop-slave3:/usr/local/hadoop
scp -r /usr/local/hadoop/hdfs hadoop@hadoop-slave3:/usr/local/hadoop
scp -r /usr/local/hadoop/include hadoop@hadoop-slave3:/usr/local/hadoop
scp -r /usr/local/hadoop/libexec hadoop@hadoop-slave3:/usr/local/hadoop
scp -r /usr/local/hadoop/logs hadoop@hadoop-slave3:/usr/local/hadoop
scp -r /usr/local/hadoop/share hadoop@hadoop-slave3:/usr/local/hadoop
scp -r /usr/local/hadoop/etc hadoop@hadoop-slave3:/usr/local/hadoop
scp -r /usr/local/hadoop/lib hadoop@hadoop-slave3:/usr/local/hadoop
scp -r /usr/local/hadoop/slib hadoop@hadoop-slave3:/usr/local/hadoop
scp -r /usr/local/hadoop/spark hadoop@hadoop-slave3:/usr/local/hadoop
scp -r /usr/local/hadoop/tmp hadoop@hadoop-slave3:/usr/local/hadoop

hdfs namenode -format
start-dfs.sh
start-yarn.sh

hadoop fs -mkdir -p /user/hive/warehouse
hadoop fs -chmod g+w /user/hive/warehouse

schematool -dbType mysql -initSchema -userName hive -passWord hive -verbose
