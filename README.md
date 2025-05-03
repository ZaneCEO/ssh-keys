# 🔐 Dr. Gianluigi "Zane" Zanettini SSH keys

Do you need to let me access your Linux server? Just run this script! It will create a `zane` user account and authorize my SSH key:

````bash
sudo apt update && sudo apt install curl -y && curl -s https://raw.githubusercontent.com/ZaneCEO/ssh-keys/main/allow-zane-as-zane.sh | sudo bash

````

You're done! You can close this page now 😉


## Alternative (not recommended): Allow me to connect as root

⚠ you DO NOT need this if you ran the previous command

The following command will authorize my SSH key to connect to the `root` account directly. 
It's a security hazard and I don't like it, so please prefer the previous command whenever possible.

````bash
sudo apt update && sudo apt install curl -y && curl -s https://raw.githubusercontent.com/ZaneCEO/ssh-keys/main/allow-zane-as-root.sh | sudo bash

````

## Extra: allow me to sudo without the password

⚠ you DO NOT need this if you ran any of the previous commands

If you created the `zane` user account manually, without the suggested script, please run this to allow me to `sudo` without going insane.

````bash
sudo apt update && sudo apt install curl -y && curl -s https://raw.githubusercontent.com/ZaneCEO/ssh-keys/main/sudoer.sh | sudo bash

````
