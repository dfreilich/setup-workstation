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
brew bundle install

# Install vim-plug for nvim
mkdir -p ~/.vim
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/.vim ~/.config/ || true
mv ~/.config/.vim ~/.config/nvim || true
ln -s ~/.vimrc ~/.config/nvim/init.vim || true
cp vim/init.vim ~/.vim/ || true

############
# SETTINGS #
############
# set finder to display full path in title bar
defaults write com.apple.finder '_FXShowPosixPathInTitle' -bool true

# stop Photos from opening automatically
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Allow moving a window using cmd+click
defaults write -g NSWindowShouldDragOnGesture -bool true

echo "Open Rectangle"
open /Applications/Rectangle.app

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
git config --global pager.branch false

# Don't stop if docker fails

# Docker Bash Completion
# Reference https://docs.docker.com/docker-for-mac/
pushd /usr/local/etc/bash_completion.d
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion || true
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion || true
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion || true
popd

# Configure zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp -fr zsh-setup/ ~/
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

source ~/.zshrc

echo "Setup complete!"
