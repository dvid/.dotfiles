# Install iterm
# Import profile from: ~/.dot/.config/.iterm_profile
# Set terminal infinite line numbers

# Define Apache docroot

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

==> This script will install:
/usr/local/bin/brew
/usr/local/Library/...
/usr/local/share/doc/homebrew
/usr/local/share/man/man1/brew.1
/usr/local/share/zsh/site-functions/_brew
/usr/local/etc/bash_completion.d/brew
==> The following directories will be made group writable:
/usr/local/.
/usr/local/bin
==> The following directories will have their owner set to david:
/usr/local/.
/usr/local/bin
==> The following directories will have their group set to admin:
/usr/local/.
/usr/local/bin

# Git
brew install git
Bash completion has been installed to:
  /usr/local/etc/bash_completion.d

zsh completion has been installed to:
  /usr/local/share/zsh/site-functions

# wget
brew install wget

# Ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ZSH_THEME="agnoster"
ZSH_THEME=“gozilla”

# PHPBrew
brew install automake autoconf curl pcre re2c mhash libtool icu4c gettext jpeg libxml2 mcrypt gmp libevent libpng
brew link icu4c

curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
chmod +x phpbrew
sudo mv phpbrew /usr/local/bin/phpbrew
phpbrew init
vi .zshrc >> source ~/.phpbrew/bashrc
vi .zshrc >> export EDITOR=vim

phpbrew known
sudo chmod -R oga+rw /usr/libexec/apache2
sudo chmod -R oga+rw /private/etc/apache2
phpbrew lookup-prefix homebrew
phpbrew install 5.6.4 +default +mysql +hash +iconv +gd +apxs2=/usr/sbin/apxs -- --with-gd --enable-gd-natf --with-jpeg-dir --with-png-dir --with-libedit

phpbrew switch php-5.6.4
sudo apachectl start

# PHP settings
# phpbrew config = vi ~/.phpbrew/php/php-5.6.4/etc/php.ini
date.timezone = Europe/Brussels
memory_limit = 512M

# Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
composer self-update

# .dotfiles
git clone https://github.com/dvid/.dotfiles.git .dot
cd .dot && composer install
ln -s ~/.dot/vendor/VundleVim/Vundle.vim ~/.vim/bundle
ln -s ~/.dot/.vimrc ~/.vimrc
ln -s ~/.dot/.vim ~/.vim
vim +PluginInstall +qall
ln -s ~/.dot/.oh-my-zsh/custom/themes/gotham ~/.oh-my-zsh/custom/themes/
ln -s ~/.dot/vendor/bhilburn/powerlevel9k ~/.oh-my-zsh/custom/themes
ln -s ~/.dot/.gitignore_global ~/
git config --global core.excludesfile '~/.gitignore_global'

# Install powerline font + fontawesome located ~/.dot/fonts
https://github.com/gabrielelana/awesome-terminal-fonts/wiki/OS-X

# Disable Automatic Spell Checker in terminal
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Disable Rootless System Integrity Protection - SIP -
csrutil disable
csrutil status
reboot

# Enable Gatekeeper
sudo spctl --master-enable
spctl --status

# xcode
https://developer.apple.com/download/

# edit plist
# plist backup: ~/.dot/.fonts/DefaultFontFallbacks.plist.bak
cp /System/Library/Frameworks/ApplicationServices.framework/Frameworks/CoreText.framework/Resources/DefaultFontFallbacks.plist ~/Desktop
open -a Xcode.app ~/Desktop/DefaultFontFallbacks.plist
cp /System/Library/Frameworks/ApplicationServices.framework/Frameworks/CoreText.framework/Resources/DefaultFontFallbacks.plist ~/DefaultFontFallbacks.plist.bak
sudo mv ~/Desktop/DefaultFontFallbacks.plist /System/Library/Frameworks/ApplicationServices.framework/Frameworks/CoreText.framework/Resources/DefaultFontFallbacks.plist

# Mariadb
brew install mariadb

==> Downloading https://homebrew.bintray.com/bottles/mariadb-10.1.16.el_capitan.bottle.tar.gz
######################################################################## 100.0%
==> Pouring mariadb-10.1.16.el_capitan.bottle.tar.gz
==> /usr/local/Cellar/mariadb/10.1.16/bin/mysql_install_db --verbose --user=david --basedir=/usr/local/Cellar/mariadb
==> Caveats
A "/etc/my.cnf" from another install may interfere with a Homebrew-built
server starting up correctly.

To connect:
    mysql -uroot

To have launchd start mariadb now and restart at login:
  brew services start mariadb
Or, if you don't want/need a background service you can just run:
  mysql.server start
==> Summary
🍺  /usr/local/Cellar/mariadb/10.1.16: 573 files, 137.1M

# Symfony Linux and macOS systems
$ sudo curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
$ sudo chmod a+x /usr/local/bin/symfony

# Global composer
composer global require "laravel/installer"
composer global require "drush/drush"

# Install 1password and PHPstorm
brew cask 1password
brew cask phpstorm
# pstorm cmd line
# /usr/local/bin/pstorm

# Pstorm themes /Tron /Legacy
# https://github.com/daylerees/colour-schemes
wget https://raw.githubusercontent.com/daylerees/colour-schemes/master/jetbrains/legacy.icls
wget https://raw.githubusercontent.com/daylerees/colour-schemes/master/jetbrains/tron.icls
wget https://raw.githubusercontent.com/daylerees/colour-schemes/master/jetbrains/contrast/glowfish-contrast.icls
wget https://raw.githubusercontent.com/daylerees/colour-schemes/master/jetbrains/halflife.icls
wget https://raw.githubusercontent.com/daylerees/colour-schemes/master/jetbrains/contrast/darkside-contrast.icls
wget https://raw.githubusercontent.com/daylerees/colour-schemes/master/jetbrains/contrast/goldfish-contrast.icls
wget https://raw.githubusercontent.com/daylerees/colour-schemes/master/jetbrains/contrast/revelation-contrast.icls
wget https://raw.githubusercontent.com/daylerees/colour-schemes/master/jetbrains/iceberg.icls
wget https://raw.githubusercontent.com/daylerees/colour-schemes/master/jetbrains/slate.icls
wget https://raw.githubusercontent.com/daylerees/colour-schemes/master/jetbrains/contrast/halflife-contrast.icls
wget https://raw.githubusercontent.com/daylerees/colour-schemes/master/jetbrains/contrast/iceberg-contrast.icls
wget https://raw.githubusercontent.com/daylerees/colour-schemes/master/jetbrains/azure.icls
wget https://raw.githubusercontent.com/daylerees/colour-schemes/master/jetbrains/contrast/tron-contrast.icls
wget https://raw.githubusercontent.com/daylerees/colour-schemes/master/jetbrains/contrast/carbonight-contrast.icls

# Change color Theme
# Or import settings from: ~/.dot/.config/phpstorm_settings.jar

# Install Plugins
# pstorm color ide
# pstrom vi plugin
# pstorm Symfony plugin
# pstorm php annotations plugin
# pstorm ideavim plugin

# ideavimc reads ~/.vimrc directly
# However create a .ideavimrc and overwrite mappings
# let mapleader = " "
ln -s ~/.dot/.ideavimrc ~/.ideavimrc

# Repeatig keys on hold
defaults write -g ApplePressAndHoldEnabled 1

# phpbrew
phpbrew ext install intl
phpbrew --debug ext install intl
phpbrew ext show intl
# https://github.com/phpbrew/phpbrew/wiki/TroubleShooting
configure: error: Unable to detect ICU prefix or no failed. Please verify ICU install prefix and make sure icu-config works.

If you got this:

checking for location of ICU headers and libraries... not found
configure: error: Unable to detect ICU prefix or no failed. Please verify ICU install prefix and make sure icu-config works.
Your icu4c is not setup properly, you need to run:

brew install intltool icu4c
brew link icu4c gettext --force
#

# Cool retro term
brew tap caskroom/cask
brew cask install cool-retro-term
open -a cool-retro-term

# Point Xcode-select to the correct Xcode Developer directory with the command:
sudo xcode-select -s /Applications/Xcode-beta.app/Contents/Developer
# Confirm the license agreement with the command:
xcodebuild -license

# Intall Atom
brew cask install atom

# Disabling Spotlight indexing
sudo mdutil -a -i off

# https://github.com/ggreer/the_silver_searcher
brew install the_silver_searcher

# Hide all icons from desktop
defaults write com.apple.finder CreateDesktop -bool false

# http://computers.tutsplus.com/tutorials/how-to-launch-any-app-with-a-keyboard-shortcut--mac-31463

# cask
brew cask install google-chrome
brew cask install firefox

# Fonts Sierra update:
# https://github.com/bhilburn/powerlevel9k/issues/235
install Sauce Code Pro Nerd Font Complete from https://github.com/ryanoasis/nerd-fonts

# Brew services management
brew tap gapple/services
brew services start elasticsearch
