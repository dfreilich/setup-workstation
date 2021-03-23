# AppsFLyer requirements
source ~/source-creation-vault.sh
saml2aws login

# Enable asdf
. /usr/local/opt/asdf/asdf.sh
# Enable z
. /usr/local/etc/profile.d/z.sh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Created by `pipx` on 2021-03-10 15:59:46
export PATH="$PATH:/Users/davidfreilich/.local/bin"

# Path to your oh-my-zsh installation.
export ZSH="/Users/davidfreilich/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# Add a space in the first prompt
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
# Visual customisation of the second prompt line
local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

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

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# -='cd -'
# ...=../..
# _='sudo '
# afind='ack -il'
# egrep='egrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
# fgrep='fgrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
# g=git
# gb='git branch'
# gbD='git branch -D'
# gbd='git branch -d'
# gbda='git branch --no-color --merged | command grep -vE "^(\+|\*|\s*($(git_main_branch)|development|develop|devel|dev)\s*$)" | command xargs -n 1 git branch -d'
# gbl='git blame -b -w'
# gbnm='git branch --no-merged'
# gbr='git branch --remote'
# gclean='git clean -id'
# gcmsg='git commit -m'
# 'gcn!'='git commit -v --no-edit --amend'
# gco='git checkout'
# gcount='git shortlog -sn'
# gcp='git cherry-pick'
# gcpa='git cherry-pick --abort'
# gcpc='git cherry-pick --continue'
# gcs='git commit -S'
# gcsm='git commit -s -m'
# gd='git diff'
# gdca='git diff --cached'
# gdct='git describe --tags $(git rev-list --tags --max-count=1)'
# gdcw='git diff --cached --word-diff'
# gds='git diff --staged'
# gdt='git diff-tree --no-commit-id --name-only -r'
# gdw='git diff --word-diff'
# gf='git fetch'
# gfa='git fetch --all --prune --jobs=10'
# gfg='git ls-files | grep'
# gfo='git fetch origin'
# gg='git gui citool'
# gga='git gui citool --amend'
# ggpull='git pull origin "$(git_current_branch)"'
# ggpur=ggu
# ggpush='git push origin "$(git_current_branch)"'
# ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
# ghh='git help'
# gignore='git update-index --assume-unchanged'
# gignored='git ls-files -v | grep "^[[:lower:]]"'
# git-svn-dcommit-push='git svn dcommit && git push github $(git_main_branch):svntrunk'
# gk='\gitk --all --branches'
# gke='\gitk --all $(git log -g --pretty=%h)'
# gl='git pull'
# glg='git log --stat'
# glgg='git log --graph'
# glgga='git log --graph --decorate --all'
# glgm='git log --graph --max-count=10'
# glgp='git log --stat -p'
# glo='git log --oneline --decorate'
# globurl='noglob urlglobber '
# glod='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'\'
# glods='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'\'' --date=short'
# glog='git log --oneline --decorate --graph'
# gloga='git log --oneline --decorate --graph --all'
# glol='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'
# glola='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'
# glols='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --stat'
# glp=_git_log_prettily
# glum='git pull upstream $(git_main_branch)'
# gm='git merge'
# gma='git merge --abort'
# gmom='git merge origin/$(git_main_branch)'
# gmt='git mergetool --no-prompt'
# gmtvim='git mergetool --no-prompt --tool=vimdiff'
# gmum='git merge upstream/$(git_main_branch)'
# gp='git push'
# gpd='git push --dry-run'
# gpf='git push --force-with-lease'
# 'gpf!'='git push --force'
# gpoat='git push origin --all && git push origin --tags'
# gpristine='git reset --hard && git clean -dffx'
# gpsup='git push --set-upstream origin $(git_current_branch)'
# gpu='git push upstream'
# gpv='git push -v'
# gr='git remote'
# gra='git remote add'
# grb='git rebase'
# grba='git rebase --abort'
# grbc='git rebase --continue'
# grbd='git rebase develop'
# grbi='git rebase -i'
# grbm='git rebase $(git_main_branch)'
# grbs='git rebase --skip'
# grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
# grev='git revert'
# grh='git reset'
# grhh='git reset --hard'
# grm='git rm'
# grmc='git rm --cached'
# grmv='git remote rename'
# groh='git reset origin/$(git_current_branch) --hard'
# grrm='git remote remove'
# grs='git restore'
# grset='git remote set-url'
# grss='git restore --source'
# grst='git restore --staged'
# grt='cd "$(git rev-parse --show-toplevel || echo .)"'
# gru='git reset --'
# grup='git remote update'
# grv='git remote -v'
# gsb='git status -sb'
# gsd='git svn dcommit'
# gsh='git show'
# gsi='git submodule init'
# gsps='git show --pretty=short --show-signature'
# gsr='git svn rebase'
# gss='git status -s'
# gst='git status'
# gsta='git stash push'
# gstaa='git stash apply'
# gstall='git stash --all'
# gstc='git stash clear'
# gstd='git stash drop'
# gstl='git stash list'
# gstp='git stash pop'
# gsts='git stash show --text'
# gstu='git stash --include-untracked'
# gsu='git submodule update'
# gsw='git switch'
# gswc='git switch -c'
# gtl='gtl(){ git tag --sort=-v:refname -n -l "${1}*" }; noglob gtl'
# gts='git tag -s'
# gtv='git tag | sort -V'
# gunignore='git update-index --no-assume-unchanged'
# gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
# gup='git pull --rebase'
# gupa='git pull --rebase --autostash'
# gupav='git pull --rebase --autostash -v'
# gupv='git pull --rebase -v'
# gwch='git whatchanged -p --abbrev-commit --pretty=medium'
# gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
# history=omz_history
# l='ls -lah'
# la='ls -lAh'
# ll='ls -lh'
# ls='ls -G'
# lsa='ls -lah'
# md='mkdir -p'
# rd=rmdir
# run-help=man
# which-command=whence
# z='_z 2>&1'
#

# Options
setopt AUTO_CD
setopt CORRECT
setopt CORRECT_ALL

[[ -s "/Users/davidfreilich/.gvm/scripts/gvm" ]] && source "/Users/davidfreilich/.gvm/scripts/gvm"
