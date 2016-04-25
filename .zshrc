#export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
ZSH=/home/david/.oh-my-zsh

# Z
. /home/david/z.sh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

#WARNING! Your terminal appears to support less than 256 colors!
#If your terminal supports 256 colors, please export the appropriate environment variable
#_before_ loading this theme in your ~/.zshrc. In most terminal emulators, putting
#export TERM="xterm-256color" at the top of your ~/.zshrc is sufficient.

#ZSH_THEME="robbyrussell"
#ZSH_THEME="cobalt2"
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LINUX_ICON=$'\uF201'
POWERLEVEL9K_LOAD_ICON=''
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_VCS_BRANCH_ICON=$'\UF126 '
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time load)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_BACKGROUND='022'
POWERLEVEL9K_TIME_FOREGROUND='000'
POWERLEVEL9K_TIME_BACKGROUND='007'
#POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="black"
#POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="white"
#POWERLEVEL9K_LOAD_WARNING_BACKGROUND="black"
#POWERLEVEL9K_LOAD_WARNING_FOREGROUND="white"
#POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="black"
#POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="white"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/share/webapps/composer/bin"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PHP_INI='/etc/php/php.ini'
export DRUSH_INI='/usr/local/share/drush/drush.ini'
export PHP_OPTIONS='-d memory_limit="1024M"'
export DRUSH_NOCOLOR=FALSE
tput init

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

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
alias vi="vim"
alias sudovi="sudo vim"
alias grep='grep --color=auto'
alias soz='. ~/.zshrc'

# Opens Macvim with open -a, for opening new cmd lines files
# mvim () { ([[ -z $@ ]] || touch "$@" ) && open -a MacVim "$@"; }

# Files Edit
case $HOST in
  "Manjaro") 	alias ezsh="vi ~/.dotfiles/.zshrc"
    			alias evim="vi ~/.dotfiles/.vimrc"
    			alias ei3="vi ~/.dotfiles/.config/i3/config"
				;;
  "octogone") 	alias ezsh="vi ~/.dot/.zshrc"
    			alias evim="vi ~/.dot/.vimrc"
    			alias ei3="vi ~/.dot/.config/i3/config"
				;;
  *)			echo "No Host defined"
  				alias ezsh="vi ~/.zshrc"
				alias evim="vi ~/.vimrc"
				alias ei3="vi ~/.config/i3/config"
				;;
esac

alias szsh=". ~/.zshrc"
alias emycnf="sudovi /etc/mysql/my.cnf"
alias ehosts="sudovi /etc/hosts"
alias ephpini="sudovi /etc/php/php.ini"
alias ehttpd="sudovi /etc/httpd/conf/httpd.conf"
alias evhosts="sudovi /etc/httpd/conf/extra/httpd-vhosts.conf"
alias eenv="sudovi /etc/environment"

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

# Git
alias gs="git status"
alias gfh="git log -p"                  #let git generate the patches for each log entry

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

source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-256color/zsh-256color.plugin.zsh
source ~/.dot/vendor/powerline/powerline/powerline/bindings/zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-syntax-highlighting
    zsh-256color
)


 # Convert 8 bit r,g,b,a (0-255) to 16 bit r,g,b,a (0-65535)
 # to set terminal background.
 # r, g, b, a values default to 255
 set_bg () {

  #   osascript -e "tell application \"Terminal\" to set background color of window 1 to {$r, $g, $b, $a}"
     osascript -e "tell application \"iTerm\"
     set current_terminal to (current terminal)
     tell current_terminal
       set current_session to (current session)
       tell current_session
         set background color to $1
       end tell
     end tell
   end tell"

     reset
 }

 # Wrapping vi cmd to set background same as vim
 vi(){
     {set_bg "{0,0,0}" &} &> /dev/null
     vim $*
     {set_bg "{23130, 21074, 40092}" &} &> /dev/null
     echo -e \\033c
 }

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
