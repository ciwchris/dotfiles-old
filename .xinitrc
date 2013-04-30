#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# set the cursor
xsetroot -cursor_name left_ptr
# set dvorak keyboard layout
setxkbmap -layout dvorak

# remap the caps lock key
[[ -f $HOME/.Xmodmap ]] && xmodmap $HOME/.Xmodmap

# load Xdefaults/Xresources
# Xdefaults is deprecated and somehow Xresources
# isn't always loaded so we will load our own here
[[ -f $HOME/.Xpersonal ]] && xrdb -merge $HOME/.Xpersonal
[[ -f $HOME/.Xstandardfont ]] && xrdb -merge $HOME/.Xstandardfont
[[ -f $HOME/.bin/color-mode/set-color-mode.sh ]] && source $HOME/.bin/color-mode/set-color-mode.sh

# Start notification service for screen lock notification
/usr/lib/notification-daemon-1.0/notification-daemon &

# Setup an autolock
xautolock -time 30 -locker slimlock  -notify 8 -notifier "zenity --notification --text 'Locking...' --timeout 1" &

# Start dropbox
[[ -f $HOME/.dropbox-dist/dropbox ]] && $HOME/.dropbox-dist/dropbox /newerversion &

# start xmonad
exec xmonad
