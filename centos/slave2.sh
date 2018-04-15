#!/bin/bash

ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

sshpass -p "hadoop" ssh-copy-id -i ~/.ssh/id_rsa.pub hadoop@hadoop-master
sshpass -p "hadoop" ssh-copy-id -i ~/.ssh/id_rsa.pub hadoop@hadoop-slave1
sshpass -p "hadoop" ssh-copy-id -i ~/.ssh/id_rsa.pub hadoop@hadoop-slave2
sshpass -p "hadoop" ssh-copy-id -i ~/.ssh/id_rsa.pub hadoop@hadoop-slave3

sudo chmod 0600 ~/.ssh/authorized_keys
