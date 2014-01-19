#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# fixes alt-3 on UK Mac keyboards to get a '#'
source mac_uk_hashfix.sh


# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Need brew to replace 'sudo apt-get install' commands
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
# sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
# sudo apt-get install python-software-properties

# sudo apt-add-repository -y ppa:cassou/emacs
# sudo apt-get update
# sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg
brew install emacs

# git pull and install dotfiles as well
cd $HOME
if [ -d ./osx_dotfiles/ ]; then
    mv osx_dotfiles osx_dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi

git clone https://github.com/kushalj/osx_dotfiles.git
ln -sb osx_dotfiles/.screenrc .
ln -sb osx_dotfiles/.bash_profile .
ln -sb osx_dotfiles/.bashrc .
ln -sb osx_dotfiles/.bashrc_custom .
ln -sf osx_dotfiles/.emacs.d .

# Amazon EC2 metadata tools
echo "wget http://s3.amazonaws.com/ec2metadata/ec2-metadata"
echo "chmod u+x ec2-metadata"

# this can set the git to push over SSH instead of HTTP
# git remote set-url origin git@github.com:kushalj/setup-node.git

