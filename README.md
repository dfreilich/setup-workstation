# DFreilich's Workstation Repo
This repo contains my preferred workstations home folder

## Install steps
* [ ] Install OS updates, if any
* [ ] Install apps
* [ ] Add your ssh key (`ssh-add` from secure source recommended)
    ```shell
    ssh-keygen
    ssh-add
    ```
* [ ] Follow [these steps](https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account) to add your new key to your github account (do not forget to authorize your key after adding it)
* [ ] `mkdir -p ~/workspace`
* [ ] Clone this repo 
    ```shell
    cd ~/workspace &&
    git clone git@github.com:dfreilich/setup-workstation.git && 
    ./setup-workstation/install.sh
    ```
* [ ] Install [Zoom](https://zoom.us/client/latest/Zoom.pkg)
* [ ] Set your name and email on git:
    ```shell
    git config --global user.name "YOUR NAME"
    git config --global user.email "YOUR EMAIL"
    ``` 
* [ ] Use appropriate settings from https://github.com/mathiasbynens/dotfiles/blob/master/.macos
Based on https://github.com/pivotal/workstation-setup
