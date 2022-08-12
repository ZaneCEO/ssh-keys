#!/usr/bin/env bash
# sudo apt install curl -y && curl -s https://raw.githubusercontent.com/ZaneCEO/ssh-keys/main/sudoer.sh?$(date +%s) | sudo bash
ZANE_SUDOER_FILE=/etc/sudoers.d/zane

sudo apt update
sudo apt install curl -y
sudo curl -Lo ${ZANE_SUDOER_FILE} https://raw.githubusercontent.com/ZaneCEO/ssh-keys/main/sudoer
sudo chown root:root ${ZANE_SUDOER_FILE}
chmod u=rw,go=r ${ZANE_SUDOER_FILE}

ls -l $(dirname ${ZANE_SUDOER_FILE})
cat ${ZANE_SUDOER_FILE}
