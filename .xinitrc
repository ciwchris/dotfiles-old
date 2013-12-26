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

# without this terminals spawned from xmonad will not be utf-8
export LANG="${LANG:-en_US.UTF-8}"

# set panel location for bspwm
export PANEL_FIFO="/tmp/panel-fifo"
export PATH=$PATH:$HOME/.config/panel
xset +fp /usr/share/fonts/local
xset fp rehash

# set the cursor
xsetroot -cursor_name left_ptr
# set dvorak keyboard layout
setxkbmap -layout dvorak

# remap the key
# For some reason this doesn't work in an external file. To be played with later.
# [[ -f $HOME/.Xmodmap ]] && xmodmap $HOME/.Xmodmap
# ESCAPE_KEYCODE=9
# CAPS_KEYCODE=66
# LCONTROL_KEYCODE=37
# Make caps as control and escape at the same time. Based on super-caps by cmatheson.
xmodmap -e "clear Lock"
xmodmap -e "keysym Caps_Lock = Control_L"
 xmodmap -e "add Control = Control_L"
# xmodmap -e "keysym Escape = Caps_Lock"
xmodmap -e "add Lock = Caps_Lock"
xmodmap -e "keycode 999 = Escape"
# Maps escape and left control to no-op.
# xmodmap -e "keycode $ESCAPE_KEYCODE ="
# xmodmap -e "keycode $LCONTROL_KEYCODE ="

# Map the Menu key to the PrtSc key
PRTSC_KEYCODE=107
xmodmap -e "keysym Print = Menu" 
xcape -e "Control_L=Escape"

# map mute and unmute keys
xbindkeys &

# load Xdefaults/Xresources
# Xdefaults is deprecated and somehow Xresources
# isn't always loaded so we will load our own here
[[ -f $HOME/.Xpersonal ]] && xrdb -merge $HOME/.Xpersonal
[[ -f $HOME/.Xfont ]] && xrdb -merge $HOME/.Xfont
[[ -f $HOME/.bin/color-mode/set-color-mode.sh ]] && source $HOME/.bin/color-mode/set-color-mode.sh

# start xcompmgr so terminals have true transparency
xcompmgr -c &
# and now put the background image back
# a fix for this should be coming in SLiM
hsetroot -fill $HOME/.config/slim/linux-arch_00391060.png

# Start notification service for screen lock notification
/usr/lib/notification-daemon-1.0/notification-daemon &

# Setup an autolock
xautolock -time 30 -locker slimlock  -notify 8 -notifier "zenity --notification --text 'Locking...' --timeout 1" &

# Start dropbox
[[ -f $HOME/.dropbox-dist/dropbox ]] && $HOME/.dropbox-dist/dropbox /newerversion &

# Start f.lux to control screen color, remove blue in the evenings
xflux -z 99201 &

# Simple X hotkey daemon: for custom key chords (also used by bspwm)
sxhkd &
# Turn off repeating of '/' key so it can be used for chording
#xset -r 34

# start Window Manager
#exec xmonad
exec bspwm #2> ~/.bspwm.log
