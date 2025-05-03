#!/usr/bin/env bash

## bash-fx
if [ -z $(command -v curl) ]; then sudo apt update && sudo apt install curl -y; fi

if [ -f "/usr/local/turbolab.it/bash-fx/bash-fx.sh" ]; then
  source "/usr/local/turbolab.it/bash-fx/bash-fx.sh"
else
  source <(curl -s https://raw.githubusercontent.com/TurboLabIt/bash-fx/main/bash-fx.sh)
fi
## bash-fx is ready

fxHeader "🔑 Allow Zane to SSH as root"
rootCheck

fxTitle "Creating .ssh directory..."
mkdir -p /root/.ssh

fxTitle "Preparing the authorized_keys file..."
if [ -f /root/.ssh/authorized_keys ]; then
  echo "" >> /root/.ssh/authorized_keys
fi

fxTitle "Adding Zane's keys to the authorized_keys file..."
curl https://raw.githubusercontent.com/ZaneCEO/ssh-keys/main/authorized_keys_zane >> /root/.ssh/authorized_keys
fxSshResetUserSshPermissions "root"

fxEndFooter
