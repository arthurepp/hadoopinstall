#!/bin/bash

ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

ssh-copy-id -i ~/.ssh/id_rsa.pub hadoop@hadoop-master
ssh-copy-id -i ~/.ssh/id_rsa.pub hadoop@hadoop-slave1
ssh-copy-id -i ~/.ssh/id_rsa.pub hadoop@hadoop-slave2
ssh-copy-id -i ~/.ssh/id_rsa.pub hadoop@hadoop-slave3

sudo chmod 0600 ~/.ssh/authorized_keys
