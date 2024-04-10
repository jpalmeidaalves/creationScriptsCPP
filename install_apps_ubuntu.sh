#!/bin/bash

#  THIS SCRIPT INSTALLL VIM, VS CODE, SSH SERVER, GOOGLE CHROME, GCC, PERL, CURL, MAKE , OH MY ZSH

# Update package index
sudo apt update

# Install Vim
sudo apt install vim -y

# Install VSCode
# Importing Microsoft GPG key and adding VS Code repository
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# Add VSCode repository to sources.list
sudo apt update

# Install VSCode
sudo apt install code -y

# Install SSH server
sudo apt install openssh-server -y

# Enable SSH server to start on boot
sudo systemctl enable ssh

# Start SSH server
sudo systemctl start ssh

# Install Google Chrome
# Add Google Chrome repository
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Update package index
sudo apt update

# Install Google Chrome
sudo apt install google-chrome-stable -y

# Install GCC, Perl, Curl, Make
sudo apt install gcc perl curl make -y

# Install Oh My Zsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installation completed successfully."
