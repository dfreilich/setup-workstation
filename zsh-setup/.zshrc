# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# AppsFLyer requirements
###################### AWS Config #################
export PATH="$PATH:/Users/davidfreilich/.local/bin:/Users/davidfreilich/.chefdk/gem/ruby/3.0.0/bin"
export ZSH="/Users/davidfreilich/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Visual customisation of the second prompt line
local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-autosuggestions
)

source ~/.p10k.zsh
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

alias ll='ls -lah'
alias gpr='git pull --rebase'
# z='_z 2>&1'
alias vim="nvim"
alias vi="nvim"
alias clean-docker='docker rm -f $(docker ps -aq) &>/dev/null; docker system prune --all -f && docker volume prune -f && docker images && docker volume ls && docker ps'
alias set-vault="export TOKEN=$(vault login -address=https://vault.appsflyer.com/ -method=ldap -path=ldap username=david.freilich password=$(cat ~/.ssh/okta) -format=json | jq -r .auth.client_token); echo $TOKEN"
# Options
setopt AUTO_CD
# setopt CORRECT
# setopt CORRECT_ALL

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
load_nvm() {
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
}

[ -f ~/.af/completion.sh ] && source ~/.af/completion.sh


alias ssh="/Users/davidfreilich/.af-ssh/update.sh; ssh $@"

alias af-scp="/Users/davidfreilich/.af-ssh/af_scp.sh $@"
# eval "$(chef shell-init zsh)"
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

