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
alias mount-mp3player="sudo mount -t vfat -o uid=ciwchris,gid=users /dev/sdb1 /mnt/mp3player"
alias monitorOff="sleep 1; xset dpms force off"
alias lock="xautolock -locknow"
alias restart="shutdown -r now"
alias shutdown="shutdown -P now"
alias ack="ack -l"
alias ang-start="git clone --depth 1 https://github.com/ciwchris/angular2-seed.git"
alias monitor-vga="xrandr --output VGA1 --auto --right-of LVDS1"
alias monitor-vga-off="xrandr --output VGA1 --off"
alias monitor-hdmi="xrandr --output HDMI1 --auto --right-of LVDS1"
alias monitor-hdmi-off="xrandr --output HDMI1 --off"
# localhost:9510/web
alias start-remote="/opt/urserver/urserver --daemon"
alias stop-remote="pkill -f 'urserver --daemon'"

FIREFOX_BIN=/usr/bin/firefox


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
plugins=(git git-extras lein)

source $ZSH/oh-my-zsh.sh
# Deprecated but being set by oh-my-zsh
unset GREP_OPTIONS
source $HOME/programs/git/nvm/nvm.sh

# Customize to your needs...
export GEM_HOME=$(ruby -rubygems -e "puts Gem.user_dir")
export VISUAL=vim
export EDITOR=vim
export CLOJURESCRIPT_HOME=$HOME/websites/clojurescript
# commented out after package update
#export JAVA_HOME=/usr/lib/jvm/java-7-openjdk
export JAVA_HOME=/usr/lib/jvm/java-default-runtime

PATH+=":$(ruby -rubygems -e "puts Gem.user_dir")/bin:$HOME/.bin:$JAVA_HOME/bin"

# Add android directories for cordova
PATH+=":/opt/android-sdk/platform-tools:/opt/android-sdk/tools"

# Use keychain to control ssh-agent and ssh-add across multiple login sessions
alias ssh='eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa) && ssh'


# Create symbolic links to directory location to jump to the location easily
# http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
export MARKPATH=$HOME/.marks
function jump {
	cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
	mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
	rm -i "$MARKPATH/$1"
}
function marks {
	ls -l "$MARKPATH" | sed 's/ / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}
function _completemarks {
	reply=($(ls $MARKPATH))
}
compctl -K _completemarks jump
compctl -K _completemarks unmark
# End jumps

# Vim in zsh
# enable vim mode on commmand line
bindkey -v

# no delay entering normal mode
# https://coderwall.com/p/h63etq
# https://github.com/pda/dotzsh/blob/master/keyboard.zsh#L10
# 10ms for key sequences
KEYTIMEOUT=1

# show vim status
# http://zshwiki.org/home/examples/zlewidgetsfunction
function zle-line-init zle-keymap-select {
	RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
	RPS2=$RPS1
	zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# add missing vim hotkeys
# fixes backspace deletion issues
# http://zshwiki.org/home/zle/vi-mode
bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# history search in vim mode
# http://zshwiki.org./home/zle/bindkeys
# why_isn_t_control-r_working_anymore
bindkey -M viins '^s' history-incremental-search-backward
bindkey -M vicmd '^s' history-incremental-search-backward
# End Vim in zsh

