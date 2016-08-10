#                   ██
#                  ░██
#    ██████  ██████░██      ██████  █████
#   ░░░░██  ██░░░░ ░██████ ░░██░░█ ██░░░██
#      ██  ░░█████ ░██░░░██ ░██ ░ ░██  ░░
#     ██    ░░░░░██░██  ░██ ░██   ░██   ██
#    ██████ ██████ ░██  ░██░███   ░░█████
#   ░░░░░░ ░░░░░░  ░░   ░░ ░░░     ░░░░░


ZSH_THEME="powerlevel9k/powerlevel9k"

case $HOST in
  "Manjaro") 	# Z
                . /usr/local/src/z/z.sh

                # Path to your oh-my-zsh installation.
                ZSH=/home/david/.oh-my-zsh

                #archey

				# Powerlevel9k
                POWERLEVEL9K_LOAD_ICON=''
                POWERLEVEL9K_HOME_SUB_ICON=''
                POWERLEVEL9K_FOLDER_ICON=''
				POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''

                # Alias
                alias ezsh="vi ~/.dot/.zshrc"
                alias evim="vi ~/.dot/.vimrc"
                alias ei3="vi ~/.dot/.config/i3/config"

				;;

  "octogone" | "captan.local")
                # Z
                . /Users/david/.oh-my-zsh/plugins/z/z.sh

				# Powerlevel9k
				POWERLEVEL9K_MODE='awesome-fontconfig'

                # Path to your oh-my-zsh installation.
                export ZSH=/Users/david/.oh-my-zsh

                #oh-my-zsh
                source $ZSH/oh-my-zsh.sh

                # Alias
                alias ezsh="vi ~/.dot/.zshrc"
                alias evim="vi ~/.dot/.vimrc"
                alias ei3="vi ~/.dot/.config/i3/config"
				;;

  *)			echo "No Host defined"

                alias ezsh="vi ~/.zshrc"
				alias evim="vi ~/.vimrc"
				alias ei3="vi ~/.config/i3/config"
				;;
esac

# phpbrew
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

#POWERLEVEL9K_LINUX_ICON=$'\uF201'
POWERLEVEL9K_LINUX_ICON=''
POWERLEVEL9K_APPLE_ICON=''
POWERLEVEL9K_HOME_ICON=''
#POWERLEVEL9K_VCS_BRANCH_ICON=$'\UF126'
POWERLEVEL9K_COLOR_SCHEME='light'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time load)
#POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_BACKGROUND='000'
POWERLEVEL9K_STATUS_ERROR_BACKGROUND='000'
POWERLEVEL9K_TIME_FOREGROUND='000'
POWERLEVEL9K_TIME_BACKGROUND='007'
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="black"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="black"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="022"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="black"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="yellow"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='011'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='011'

#vi /home/david/.oh-my-zsh/custom/themes/powerlevel9k/functions/icons.zsh

#GOTHAM_SHELL="$HOME/.oh-my-zsh/custom/themes/gotham.sh"
#[[ -s $GOTHAM_SHELL ]] && source $GOTHAM_SHELL

#autoload -Uz colors && colors
#autoload -U compinit colors zcalc
#compinit
#colors

setopt correct          # Auto correct mistakes
setopt extendedglob     # Extended globbing
setopt nocaseglob       # Case insensitive globbing
setopt rcexpandparam    # Array expension with parameters
#setopt nocheckjobs      # Don't warn about running processes when exiting
setopt numericglobsort  # Sort filenames numerically when it makes sense
#setopt nohup            # Don't kill processes when exiting
#setopt nobeep           # No beep
setopt appendhistory    # Immediately append history instead of overwriting
setopt histignorealldups #If a new command is a duplicate, remove the older one
setopt autocd

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

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
HISTSIZE=

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

export EDITOR=vim

#export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/share/webapps/composer/bin"
#export PATH="$HOME/.composer/vendor/bin:$PATH"
#export PHP_INI='/etc/php/php.ini'
#export DRUSH_INI='/usr/local/share/drush/drush.ini'
#export PHP_OPTIONS='-d memory_limit="1024M"'
#export DRUSH_NOCOLOR=FALSE
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
tput init

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
#export LANG=en_US.UTF-8

# xterm-256color
#export TERM="xterm-256color"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Alias
# Vim Quick edit mode
# Used also by git
vi(){
	vim $*
    echo -e \\033c
}

# Vim Quick edit mode
vv(){
	vim --noplugin $*
    echo -e \\033c
}

#alias sudovi="sudo vim"
alias grep='grep --color=auto'
alias .z='. ~/.zshrc'

# Opens Macvim with open -a, for opening new cmd lines files
# mvim () { ([[ -z $@ ]] || touch "$@" ) && open -a MacVim "$@"; }


alias szsh=". ~/.zshrc"
alias emycnf="sudovi /etc/mysql/my.cnf"
alias ehosts="sudovi /etc/hosts"
alias ephpini="sudovi /etc/php/php.ini"
alias ehttpd="sudovi /etc/httpd/conf/httpd.conf"
alias evhosts="sudovi /etc/httpd/conf/extra/httpd-vhosts.conf"
alias eenv="sudovi /etc/environment"
alias selenium="java -jar /home/david/selenium-server-standalone-2.37.0.jar"

# System
alias rxr="xrdb ~/.Xresources"
alias cfc="fc-cache -fv ~/.local/share/fonts"
alias lmf="fc-list | grep .local/share/fonts"
#sudo fc-cache -vf
#fc-cache
#fc-list
#sudo mkfontscale
#sudo mkfontdir
#xrdb -q
#systemctl --failed
#sudo localectl set-locale en_US.UTF-8
#vi +PluginInstall +qall
#fc-match FontAwesome 				#search font if installed
#urxvt -fn "xft:FontAwesome" 		#test urxvt with passed font
#pacman -Qqen | grep z 				#list installed pacman packages
#echo "\uF008" "\uF20A" "\uE20E"
#echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699" "\uE0B0"
#xset q								#list system settings
#xset +fp /home/david/.local/share/fonts #define new font path

# Launcher
alias clock="tty-clock -c -s"
alias pstorm="/usr/local/bin/pstorm"
alias aconftest="apachectl configtest"
alias astatus="systemctl status httpd.service"
#alias arestart="sudo systemctl restart httpd"
alias arestart="sudo apachectl restart"
alias sshs="sudo systemctl start sshd.service"
alias sshd="sudo systemctl enable sshd.service"
alias sshdev="ssh isa@s-cnect-isadru"

# Manjaro updates
alias linstalk="mhwd-kernel -li" 		#list installed kernels
alias llk="mhwd-kernel -l" 				#list linux kernels available
alias ilk="sudo mhwd-kernel -i linux"	#install linux kernel version ex:linux41
alias ums="sudo pacman -Syu"

# Reboot - Shutdown
alias reboot="sudo shutdown -r now"
alias shutdown="sudo shutdown -h now"

# Git
alias gs="git status"
alias gfh="git log -p"                  #let git generate the patches for each log entry

# Grep - search string in folder,
alias ssf="grep -rnw . -e ''"

# Proxy
assignProxy(){
   PROXY_ENV="http_proxy ftp_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY ALL_PROXY"
   for envar in $PROXY_ENV
   do
     export $envar=$1
   done
   for envar in "no_proxy NO_PROXY"
   do
      export $envar=$2
   done
 }

 clrProxy(){
   assignProxy "" # This is what 'unset' does.
 }

 activeP(){
   #user=YourUserName
   #read -p "Password: " -s pass &&  echo -e " "
   proxy_value="http://polidda:enjoyFreedom001@psbru.cec.eu.int:8012"
   no_proxy_value=".local,.dev,localhost,127.0.0.1,localaddress,.localdomain.com,.ec.europa.eu"
   assignProxy $proxy_value $no_proxy_value
 }

alias pbcopy="xclip -selection c"
alias pbpaste="xclip -selection clipboard -o"
alias timer="echo n7Dv23kh | pbcopy && firefox 'https://webgate.ec.europa.eu/fpfis/timeclock/timeclock.php'"

alias hvimium="echo '
Vimium shortcuts:

h       scroll left
j       scroll down
k       scroll up
l       scroll right
gg      scroll to top of the page
G       scroll to bottom of the page
f       activate link hints mode to open in current tab
F       activate link hints mode to open in new tab
r       reload
gf      view source
zi      zoom in
zo      zoom out
/       enter find mode -- esc to cancel
n       cycle forward to the next find match
N       cycle backward to the previous find match
i       enter insert mode -- esc to exit
yy      copy the current url to the clipboard
ba      go back in history
fw      go forward in history
J       go one tab left
K       go one tab right
t       create tab
d       close current tab
u       restore closed tab (unwind the 'd' command)
'"

# Plugins

#source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/.oh-my-zsh/custom/plugins/zsh-256color/zsh-256color.plugin.zsh
source ~/.dot/vendor/powerline/powerline/powerline/bindings/zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	extract
    git
    #zsh-syntax-highlighting
    #zsh-256color
	z
)

 #
 #
 #    if [ "$#" -eq  "0" ]
 #    then
 #        echo "No arguments supplied"
 #    else
 #        echo "Hello world"
 #    fi

# Functions

# ex - archive extractor
# usage: ex <file>
ex() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
