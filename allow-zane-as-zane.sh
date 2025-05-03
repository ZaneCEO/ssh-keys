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
curl -s https://raw.githubusercontent.com/ZaneCEO/ssh-keys/main/sudoer.sh | bash


fxTitle "🔏 Authorizing Zane's SSH key(s)..."
SSH_DIR=/home/zane/.ssh/
mkdir -p ${SSH_DIR}
curl -Lo ${SSH_DIR}authorized_keys https://raw.githubusercontent.com/ZaneCEO/ssh-keys/main/authorized_keys_zane
fxSshResetUserSshPermissions "zane"


fxEndFooter
