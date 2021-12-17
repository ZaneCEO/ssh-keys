#!/bin/bash
## https://github.com/ZaneCEO/ssh-keys

echo ""
echo -e "\e[1;31m 🔑 Allowing Zane to connect via SSH as root... \e[0m"

sudo mkdir /root/.ssh

if [ -f /root/.ssh/authorized_keys ]; then
  sudo echo "" >> /root/.ssh/authorized_keys
fi

sudo curl https://raw.githubusercontent.com/ZaneCEO/ssh-keys/main/authorized_keys_zane?$(date +%s) >> /root/.ssh/authorized_keys
sudo chown root:root /root/.ssh/ -R
sudo chmod u=rwx,go= /root/.ssh/ -R
chmod u=rw,go= /root/.ssh/*

echo -e "\e[1;31m ✔️ DONE \e[0m"
