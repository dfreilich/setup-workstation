#!/bin/bash

xcode-select --install

set -e

echo "Caching password..."
sudo -K
sudo true;
clear

MY_DIR="$(dirname "$0")"

if hash brew 2>/dev/null; then
  echo "Homebrew is already installed!"
else
  echo "Installing Homebrew..."
  yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo
echo "Ensuring your Homebrew directory is writable..."
sudo chown -Rf $(whoami) $(brew --prefix)/*

echo
echo "Upgrading existing brews..."
brew upgrade

echo "Cleaning up your Homebrew installation..."
brew cleanup

echo
echo "Adding Homebrew's sbin to your PATH..."
echo 'export PATH="/usr/local/sbin:$PATH"' >> ~/.bash_profile

############
# INSTALLS #
############
mkdir -p ~/go/src
set +e
brew bundle install
set -e

# Install GVM
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

# Install vim-plug for nvim
mkdir -p ~/.vim
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/.vim ~/.config/
mv ~/.config/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
cp vim/init.vim ~/.vim/

############
# SETTINGS #
############
echo "configure shiftit to select 1/3 screen width, 1/2 screen width and 2/3 screen width:"
defaults write org.shiftitapp.ShiftIt multipleActionsCycleWindowSizes YES

# set finder to display full path in title bar
defaults write com.apple.finder '_FXShowPosixPathInTitle' -bool true

# stop Photos from opening automatically
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
#to revert use defaults -currentHost delete com.apple.ImageCapture disableHotPlug

echo "Configuring ShiftIt"
open /Applications/ShiftIt.app

echo "Configuring FlyCut"
open /Applications/Flycut.app

echo "If hostname needs to be set consider"
echo "sudo scutil --set ComputerName newname"
echo "sudo scutil --set LocalHostName newname"
echo "sudo scutil --set HostName newname"

echo "Setting up Git aliases..."
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit --signoff
git config --global alias.br branch
git config --global alias.sta stash
git config --global alias.llog "log --date=local"
git config --global alias.flog "log --pretty=fuller --decorate"
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# Don't stop if docker fails
set +e

# Docker Bash Completion
# Reference https://docs.docker.com/docker-for-mac/
pushd /usr/local/etc/bash_completion.d
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
popd


echo "Setup complete!"
