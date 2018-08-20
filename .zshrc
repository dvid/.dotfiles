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
  "Manjaro") 	
				# Powerlevel9k Mode
				# POWERLEVEL9K_MODE='awesome-fontconfig'
				POWERLEVEL9K_MODE='nerdfont-complete'
				# POWERLEVEL9K_MODE='awesome-patched'
                # POWERLEVEL9K_LOAD_ICON=''
                # POWERLEVEL9K_HOME_SUB_ICON=''
                # POWERLEVEL9K_FOLDER_ICON=''
				# POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0B3'

                # Path to your oh-my-zsh installation.
                ZSH=/home/david/.oh-my-zsh

                #archey

                # Alias
				alias reboot="sudo shutdown -r now"
				alias shutdown="sudo shutdown -h now"
                alias ezsh="vi ~/.dot/.zshrc"
                alias evim="vi ~/.dot/.vimrc"
                alias ei3="vi ~/.dot/.config/i3/config"
				alias eenv="sudo vi /etc/environment"
				alias exre="vi ~/.Xresources"
				alias rxre="xrdb ~/.Xresources"
				alias cfc="fc-cache -fv ~/.local/share/fonts"
				alias lfl="fc-list | grep .local/share/fonts"
				alias lfi="fc-list | grep " 	#fontname as argument
				alias mfi="fc-match " 			#fontname as argument
				alias urxvtfont="urxvt -fn " 	#"xft:TerminessTTF Nerd Font"
				alias pli="pacman -Qqen | grep " #list installed pacman packages
				alias pbcopy="xclip -selection c"
				alias pbpaste="xclip -selection clipboard -o"
				alias timer="echo n7Dv23kh | pbcopy && firefox 'https://webgate.ec.europa.eu/fpfis/timeclock/timeclock.php'"
				alias clock="tty-clock -c -s"
				alias pstorm="/usr/local/bin/pstorm"
				alias aconftest="apachectl configtest"
				alias astatus="systemctl status httpd.service"
				alias sshs="sudo systemctl start sshd.service"
				alias sshd="sudo systemctl enable sshd.service"
				alias sshdev="ssh isa@s-cnect-isadru"
				alias sqlre="mysql.server restart"
				alias emycnf="sudo vi /etc/mysql/my.cnf"
				alias evhosts="sudo vi /etc/httpd/conf/extra/httpd-vhosts.conf"
				alias ephpini="sudo vi /etc/php/php.ini"
				alias ehttpd="sudo vi /etc/httpd/conf/httpd.conf"
				alias arestart="sudo systemctl restart httpd"
				alias selenium="java -jar /home/david/selenium-server-standalone-2.37.0.jar"
				;;

  "octogone" | "captan.local" | "gbw-l-m0013.local")
                # Z
                . ~/.oh-my-zsh/plugins/z/z.sh

				# Powerlevel9k
				POWERLEVEL9K_MODE='awesome-fontconfig'

                # Path to your oh-my-zsh installation.
                export ZSH=~/.oh-my-zsh

                # ValueError: unknown locale: UTF-8 vim
                export LC_ALL=en_US.UTF-8
                export LANG=en_US.UTF-8

                #oh-my-zsh
                source $ZSH/oh-my-zsh.sh

                # Alias
                alias ezsh="vi ~/.dot/.zshrc"
                alias evim="vi ~/.dot/.vimrc"
                alias ei3="vi ~/.dot/.config/i3/config"
				alias emycnf="sudo vi /etc/my.cnf"
				alias evhosts="sudo vi /private/etc/apache2/extra/httpd-vhosts.conf"
				alias ephpini="sudo vi ~/.phpbrew/php/php-5.6.4/etc/php.ini"
				alias ehttpd="sudo vi /etc/apache2/httpd.conf"
				alias arestart="sudo apachectl restart"
				;;

  *)			echo "No Host defined"

                alias ezsh="vi ~/.zshrc"
				alias evim="vi ~/.vimrc"
				alias ei3="vi ~/.config/i3/config"
				;;
esac


# fasd init
eval "$(fasd --init auto)"

# phpbrew
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

#POWERLEVEL9K_LINUX_ICON=$'\uF201'
POWERLEVEL9K_APPLE_ICON=''
POWERLEVEL9K_HOME_ICON=''
#POWERLEVEL9K_VCS_BRANCH_ICON=$'\UF126'
POWERLEVEL9K_COLOR_SCHEME='light'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs) #os_icon 
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time load)
#POWERLEVEL9K_STATUS_VERBOSE=false
#POWERLEVEL9K_OK_ICON=''
POWERLEVEL9K_STATUS_OK_BACKGROUND='000'
#POWERLEVEL9K_STATUS_OK_BACKGROUND='000'
POWERLEVEL9K_STATUS_OK_FOREGROUND='yellow'
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

# Editor
export EDITOR=vim

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

HIST_STAMPS="dd/mm/yyyy"
HISTSIZE=

#export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/share/webapps/composer/bin"
#export PHP_INI='/etc/php/php.ini'
#export DRUSH_INI='/usr/local/share/drush/drush.ini'
#export PHP_OPTIONS='-d memory_limit="1024M"'
#export DRUSH_NOCOLOR=FALSE
export PATH="$HOME/.composer/vendor/bin/:$PATH"
tput init

# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Vim Quick edit mode
# also used by git
vi(){
	vim $*
    echo -e \\033c
}

# Vim fast edit mode
vv(){
	vim --noplugin $*
    echo -e \\033c
}

# Opens Macvim with open -a argument. 
# Needed to open files through cmd line.
# mvim () { ([[ -z $@ ]] || touch "$@" ) && open -a MacVim "$@"; }

# Alias Common
alias grep='grep --color=auto'
alias ehosts="sudo vi /etc/hosts"

# Git
alias gs="git status"
alias grh="git reset --soft HEAD\^"     #Reset unpushed local commits
alias gpr="git remote prune origin"		#Git prune
alias gh="git log -p"                   #let git generate the patches for each log entry
alias gfh="git log --follow -p -- "		#Show file history / gitk
alias glog="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\n--abbrev-commit --date=relative"
alias gsl="git stash list"
alias gss="git stash show -p stash@{0}"
alias gsp="git stash pop stash@{0}"
alias gsd="git stash drop stash@{2}"

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

###     ###
# Plugins #
###     ###

source ~/.dot/vendor/powerline/powerline/powerline/bindings/zsh

# Oh-my-zsh Plugins
plugins=(
	extract
    git
    #zsh-syntax-highlighting
    #zsh-256color
	z
)

###     ###
#Functions#
###     ###

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


###    ###
### UZ ###
###    ###

alias con='bin/console'
alias brews='brew services start elasticsearch@1.7'
alias eelastic='sudo vi /usr/local/opt/elasticsearch@1.7/config/elasticsearch.yml'

###    ###
## HELP ##
###    ###

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

# sudo pacman -S yaourt
# yaourt -Syy
# yaourt -S nerd-fonts-complete
#sudo mkfontscale
#sudo mkfontdir
#systemctl --failed
#sudo localectl set-locale en_US.UTF-8
#
#echo "\uF008" "\uF20A" "\uE20E"
#echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699" "\uE0B0"
#xset q								#list system settings
#xset +fp /home/david/.local/share/fonts #define new font path

#    if [ "$#" -eq  "0" ]
#    then
#        echo "No arguments supplied"
#    else
#        echo "Hello world"
#    fi
