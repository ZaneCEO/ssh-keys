#!/usr/bin/env bash

## bash-fx
if [ -z $(command -v curl) ]; then sudo apt update && sudo apt install curl -y; fi

if [ -f "/usr/local/turbolab.it/bash-fx/bash-fx.sh" ]; then
  source "/usr/local/turbolab.it/bash-fx/bash-fx.sh"
else
  source <(curl -s https://raw.githubusercontent.com/TurboLabIt/bash-fx/main/bash-fx.sh)
fi
## bash-fx is ready

fxTitle "Allowing Zane to sudo"

ZANE_SUDOER_FILE=/etc/sudoers.d/zane
sudo curl -Lo ${ZANE_SUDOER_FILE} https://raw.githubusercontent.com/ZaneCEO/ssh-keys/main/sudoer
sudo chown root:root ${ZANE_SUDOER_FILE}
sudo chmod u=rw,go=r ${ZANE_SUDOER_FILE}

echo ""
ls -l $(dirname ${ZANE_SUDOER_FILE})

echo ""
cat ${ZANE_SUDOER_FILE}

fxOK "Done!"
