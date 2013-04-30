#!/bin/sh

if [ -z $1 ]; then
	[[ -f $HOME/.Xstandardfont ]] && xrdb -merge $HOME/.Xstandardfont
elif [[ "$1" =~ ^[0-9]+$ ]]; then
	echo "
! urxvt
URxvt*font: xft:terminus12:size=$1:antialias=true" > $HOME/.Xcustomfont

	xrdb -merge $HOME/.Xcustomfont
fi
