# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"
[[ -f $HOME/.bin/color-mode/current-color-mode ]] && SOLARIZED_THEME=$(<$HOME/.bin/color-mode/current-color-mode)

alias disk-usage="sudo du */ -smx | sort -n"
alias btsync-start="sudo systemctl start btsync@ciwchris"
alias btsync-stop="sudo systemctl stop btsync@ciwchris"
alias screencastRecord="$HOME/.bin/video_recording.sh -s"
alias webcamRecord="$HOME/.bin/video_recording.sh -w"
alias youtubeConvert="$HOME/.bin/video_recording.sh -y"
alias webmConvert="$HOME/.bin/video_recording.sh -c"

alias monitorOff="sleep 1; xset dpms force off"
alias lock="xautolock -locknow"
alias restart="shutdown -r now"
alias shutdown="shutdown -P now"
alias ack="ack -l"


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

# Other plugins to try (archlinux bundler gem lein mvn npm vi-mode last-working-dir)
plugins=(git git-extras)

source $ZSH/oh-my-zsh.sh
source $HOME/programs/git/nvm/nvm.sh

# Customize to your needs...
PATH+=":$(ruby -rubygems -e "puts Gem.user_dir")/bin"
PATH+=":$HOME/.bin"

export GEM_HOME=$(ruby -rubygems -e "puts Gem.user_dir")
export VISUAL=vim
export EDITOR=vim

# Use keychain to control ssh-agent and ssh-add across multiple login sessions
alias ssh='eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa) && ssh'
