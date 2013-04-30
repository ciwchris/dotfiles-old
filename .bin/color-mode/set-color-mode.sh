#!/bin/sh 

if [ -f $HOME/.bin/color-mode/current-color-mode ]; then
	SOLARIZED_THEME=$(<$HOME/.bin/color-mode/current-color-mode)
	if [ "$SOLARIZED_THEME" = "light" ]; then
		[[ -f $HOME/.Xlight ]] && xrdb -merge $HOME/.Xlight
	else
		[[ -f $HOME/.Xdark ]] && xrdb -merge $HOME/.Xdark
	fi
else
	SOLARIZED_THEME="dark"
	echo $SOLARIZED_THEME > $HOME/.bin/color-mode/current-color-mode
	[[ -f $HOME/.Xdark ]] && xrdb -merge $HOME/.Xdark
fi
