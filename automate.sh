#!/bin/bash

# XCODE COMMAND LINE TOOLS
echo "Installing XCode Command Line Tools....."
xcode-select --install

# INSTALLING BREW
echo "Installing Brew...."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# INSTALL ZSH
echo "Installing ZSH....."
brew install zsh

# INSTALL NVM
echo "Installing NVM...."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash

# INSTALL LATEST NODE VERSION
echo "INSTALLING NODE V12...."
nvm install 12

# INSTALL ZSH TYPEWRITTEN
echo "INSTALLING TYPEWRITTEN...."
npm install -g typewritten

# ZSH SYNTAX HIGHLIGHTING
echo "INSTALLING ZSH SYNTAX HIGHLIGHTING....."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# ZSH AUTO COMPLETION
echo "INSTALLING ZSH AUTO COMPLETION....."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# INSTALL VSCODE
echo "INSTALLING VSCODE..."
brew cask install visual-studio-code

# INSTALL NOTION
echo "Installing Notion...."
brew cask install notion

# LOAD ALL CHANGES IN ZSH
source ~/.zshrc

# SETUP SSH

# personal account
ssh-keygen -t rsa -C "sriramr083@gmail.com" -f "id_personal"

# work account (TODO make this dynamic with user input)
ssh-keygen -t rsa -C "sriram.r@adpushup.com" -f "id_work"

# move keys to ~/.ssh
mv id_* ~/.ssh

# move ssh config to ~/.ssh/config
cp ssh_config ~/.ssh/config

cd ~/.ssh

# set permissions for ssh public keys (rw for me, r for everyone else)
chmod 644 *.pub

# set permissions for ssh private keys (rw for me, none for everyone else)
chmod 600 id_personal
chmod 600 id_work

#output permissions
ls -l

#add keys to ssh
ssh-add -D # delete all
ssh-add -K id_personal # add personal
ssh-add -K id_work # add work

#list keys
ssh-add -l

#output public keys to be setup in Github
echo "---------------------- PERSONAL ACCOUNT PUBLIC KEY --------------------------"
cat id_personal.pub

echo "---------------------- WORK ACCOUNT PUBLIC KEY -------------------------------"
cat id_work.pub


echo "NOTE: INCASE SSH KEYS DON'T WORK AFTER ADDING ON GITHUB, CHECK KEY PERMISSIONS."

echo "SETUP DONE SUCCESSFULLY...."
exit 0
