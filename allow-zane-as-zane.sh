#!/bin/bash
## https://github.com/ZaneCEO/ssh-keys

echo ""
echo -e "\e[1;31m 🔑 Allowing Zane to connect via SSH... \e[0m"

sudo useradd zane --create-home -s /bin/bash

sudo -u zane -H mkdir ${HOME}/zane/.ssh
sudo -u zane -H curl https://raw.githubusercontent.com/ZaneCEO/ssh-keys/main/authorized_keys_zane?$(date +%s) >> ${HOME}/zane/.ssh/authorized_keys
sudo chown zane ${HOME}/zane/.ssh -R
sudo chmod u=rwx,go= ${HOME}/zane/.ssh -R
sudo chmod u=rw,go= ${HOME}/zane/.ssh/*

echo -e "\e[1;31m ⚠️ Please allow me to sudo \e[0m"
echo "Run this:"
echo "sudo EDITOR=nano visudo"
echo ""
echo "Add this at the bottom (new line):"
echo "zane ALL=(ALL) NOPASSWD: ALL"
echo ""

echo -e "\e[1;31m ✔️ DONE \e[0m"

