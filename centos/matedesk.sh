#!/bin/bash

sudo yum install epel-release -y
sudo yum groupinstall "X Window system" -y
sudo yum groups install "MATE Desktop" -y
systemctl isolate graphical.target
