#!/bin/bash

# requires xcode and xcode-select --install to be run
xcode-select --install

# fixes alt-3 on UK Mac keyboards to get a '#'
source mac_uk_hashfix.sh

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew update

brew install git
brew install hg

brew install nodejs
npm install npm

npm install -g jshint eslint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
# sudo apt-get install -y rlwrap
brew install rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
# sudo apt-get install python-software-properties

# sudo apt-add-repository -y ppa:cassou/emacs
# sudo apt-get update
# sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg
brew install emacs --with-cocoa
ln -s /usr/local/Cellar/emacs/24.*/Emacs.app /Applications

# git pull and install dotfiles as well
cd $HOME
if [ -d ./osx_dotfiles/ ]; then
    mv osx_dotfiles osx_dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi

brew install macvim --override-system-vim

git clone https://github.com/kushalj/osx_dotfiles.git
ln -s osx_dotfiles/.screenrc .
ln -s osx_dotfiles/.bash_profile .
ln -s osx_dotfiles/.bashrc .
ln -s osx_dotfiles/.bashrc_custom .
ln -s osx_dotfiles/.emacs.d .


# this can set the git to push over SSH instead of HTTP
# git remote set-url origin git@github.com:kushalj/setup-node.git

