#!/usr/bin/env bash
# sudo apt install curl -y && curl -s https://raw.githubusercontent.com/ZaneCEO/ssh-keys/main/sudoer.sh?$(date +%s) | sudo bash

echo ""
echo -e "\e[1;31m ⚠️ Allowing Zane to sudo \e[0m"

if [ -z $(command -v curl) ]; then sudo apt update && sudo apt install curl -y; fi

ZANE_SUDOER_FILE=/etc/sudoers.d/zane
sudo curl -Lo ${ZANE_SUDOER_FILE} https://raw.githubusercontent.com/ZaneCEO/ssh-keys/main/sudoer
sudo chown root:root ${ZANE_SUDOER_FILE}
chmod u=rw,go=r ${ZANE_SUDOER_FILE}

echo ""
ls -l $(dirname ${ZANE_SUDOER_FILE})

echo ""
cat ${ZANE_SUDOER_FILE}

echo ""
echo -e "\e[1;31m ✔️ DONE \e[0m"
