#!/bin/bash
## https://github.com/ZaneCEO/ssh-keys

echo ""
echo -e "\e[1;31m 🔑 Allowing Zane to connect via SSH... \e[0m"

sudo useradd zane --create-home -s /bin/bash

SSH_DIR=/home/zane/.ssh/
sudo -u zane -H mkdir ${SSH_DIR}
sudo -u zane -H curl https://raw.githubusercontent.com/ZaneCEO/ssh-keys/main/authorized_keys_zane?$(date +%s) >> ${SSH_DIR}authorized_keys
sudo chown zane ${SSH_DIR} -R
sudo chmod u=rwx,go= ${SSH_DIR} -R
sudo chmod u=rw,go= ${SSH_DIR}*

echo ""
echo -e "\e[1;31m ⚠️ Please allow Zane to sudo \e[0m"
echo "Run this:"
echo "sudo EDITOR=nano visudo"
echo ""
echo "Add this at the bottom (new line):"
echo "zane ALL=(ALL) NOPASSWD: ALL"

echo ""
echo -e "\e[1;31m ✔️ DONE \e[0m"

