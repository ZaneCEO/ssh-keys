#!/usr/bin/env bash
SCRIPT_NAME=zane-ssh

## bash-fx
if [ -z $(command -v curl) ]; then sudo apt update && sudo apt install curl -y; fi

if [ -f "/usr/local/turbolab.it/bash-fx/bash-fx.sh" ]; then
  source "/usr/local/turbolab.it/bash-fx/bash-fx.sh"
else
  source <(curl -s https://raw.githubusercontent.com/TurboLabIt/bash-fx/main/bash-fx.sh)
fi
## bash-fx is ready


fxHeader "🔑 Allow Zane to connect via SSH"
rootCheck


fxTitle "👤 Creating the user account ##zane##..."
if id "zane" &>/dev/null; then
  fxOK "A user account named ##zane## already exists"
else
  useradd zane --create-home -s /bin/bash
fi


## allow sudo
curl -s https://raw.githubusercontent.com/ZaneCEO/ssh-keys/main/sudoer.sh?$(date +%s) | bash


## ssh key
SSH_DIR=/home/zane/.ssh/
sudo -u zane -H mkdir ${SSH_DIR}
sudo -u zane -H curl https://raw.githubusercontent.com/ZaneCEO/ssh-keys/main/authorized_keys_zane?$(date +%s) >> ${SSH_DIR}authorized_keys
sudo chown zane ${SSH_DIR} -R
sudo chmod u=rwx,go= ${SSH_DIR} -R
sudo chmod u=rw,go= ${SSH_DIR}*


fxEndFooter
