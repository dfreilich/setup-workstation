export PATH=$PATH:$HOME/go/bin
export GOCMD=richgo

. $(pack completion)

alias ll='ls -lha'
alias gpr='git pull --rebase'
alias clean-docker='docker rm -f $(docker ps -aq) &>/dev/null; docker system prune --all -f && docker volume prune -f && docker images && docker volume ls && docker ps'
alias vkl='load-key'

# Enable bash-completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

function _update_ps1() {
  PS1="$(powerline-go -error $? -modules=user,host,ssh,cwd,perms,gitlite,jobs,exit,root,vgo -colorize-hostname -mode flat -path-aliases=~/workspace=W)"
}
PROMPT_COMMAND="_update_ps1"

# Load ssh key from lastpass
function load-key() {
  [ "$1" == "-h" ] && echo "Get your key from lastpass and add to ssh agent" && return
  local NAME=$1
  local HOURS=$2
  local KEY_NOTE=$3

  if [ -z $HOURS ]; then
   CURRENT_HOUR=`date +%H | sed 's/^0//'`
   HOURS=`expr 18 - $CURRENT_HOUR`
   echo "Hours: $HOURS"
  fi

  if [ -z $KEY_NOTE ]; then
    KEY_NOTE=my-ssh-key
  fi

  if [[ `lpass status` != *"$NAME@pivotal.io"* ]]; then
    lpass login "$NAME@pivotal.io"
  fi

  lpass status 2>&1 > /dev/null
  if [[ $? -eq 0 ]]; then
    /usr/bin/ssh-add -D
    tmp_file=`mktemp`
    lpass show --notes $KEY_NOTE > $tmp_file
    # Make sure nobody messed with ssh-agent's sock $SSH_AUTH_SOCK
    command -v gnome-keyring-daemon > /dev/null && export eval `gnome-keyring-daemon -s`
    /usr/bin/ssh-add -t ${HOURS}H $tmp_file
    rm $tmp_file
  fi
}

# Load z directory jumper
. $(brew --prefix)/etc/profile.d/z.sh
