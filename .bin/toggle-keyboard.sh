#!/bin/sh

[[ -f $HOME/.bin/modes/current-keyboard-mode ]] && KEYBOARD_LAYOUT=$(<$HOME/.bin/modes/current-keyboard-mode)

if [ -z "$KEYBOARD_LAYOUT" ]; then
    setxkbmap -layout us -variant dvorak
    KEYBOARD_LAYOUT="dvorak"
elif [ "$KEYBOARD_LAYOUT" != "dvorak" ]; then
    setxkbmap -layout us -variant dvorak
    KEYBOARD_LAYOUT="dvorak"
elif [ "$SOLARIZED_THEME" != "qwerty" ]; then
    setxkbmap -layout us
    KEYBOARD_LAYOUT="qwerty"
fi
echo $KEYBOARD_LAYOUT > $HOME/.bin/modes/current-keyboard-mode

# Make caps as control and escape at the same time. Based on super-caps by cmatheson.
xmodmap -e "clear Lock"
xmodmap -e "keysym Caps_Lock = Control_L"
xmodmap -e "add Control = Control_L"
xmodmap -e "add Lock = Caps_Lock"
xmodmap -e "keycode 999 = Escape"

# # Map the Menu key to the PrtSc key
xmodmap -e "keysym Print = Menu" 

# # Make the newly mapped Caps Lock key also be used as an Escape key.
xcape -e "Control_L=Escape"

# # map mute and unmute keys
xbindkeys &
