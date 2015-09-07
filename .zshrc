#                   ██
#                  ░██
#    ██████  ██████░██      ██████  █████
#   ░░░░██  ██░░░░ ░██████ ░░██░░█ ██░░░██
#      ██  ░░█████ ░██░░░██ ░██ ░ ░██  ░░
#     ██    ░░░░░██░██  ░██ ░██   ░██   ██
#    ██████ ██████ ░██  ░██░███   ░░█████
#   ░░░░░░ ░░░░░░  ░░   ░░ ░░░     ░░░░░

#export ZSH=$HOME/.oh-my-zsh
ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="robbyrussell"
ZSH_THEME="cobalt2"
COMPLETION_WAITING_DOTS="true"

# 10 second before you can confirm a wildcard deletion
setopt RM_STAR_WAIT

# History
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

# Plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    brew
    brew-cask
    catimg
    git
    git-extras
    github
    git-prompt
    lol
    nyan
    osx
    parbs-sites
    sublime
    vagrant
    z
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source ~/.dotfiles/.aliases
source ~/.dotfiles/.functions
source ~/.dotfiles/.exports
test -f ~/.dotfiles/.secret && source ~/.dotfiles/.secret
test -f ~/.dotfiles/.work && source ~/.dotfiles/.work

PATH=${PATH}:/usr/local/src
PATH=${PATH}:/usr/local/bin
PATH=${PATH}:/usr/bin
PATH=${PATH}:/bin
PATH=${PATH}:/usr/sbin
PATH=${PATH}:/sbin
PATH=${PATH}:/usr/local/sbin
PATH=${PATH}:~/.composer/vendor/bin
PATH=${PATH}:/usr/local/Cellar/php55/5.5.17/bin
PATH=${PATH}:/usr/local/src/composer/bin
PATH=${PATH}:/usr/local/src/composer/
PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"
export PATH=${PATH}

# export MANPATH="/usr/local/man:$MANPATH"