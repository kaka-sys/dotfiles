#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# dwm status
~/.config/dwm-bar/dwm_bar.sh &

# Keyboard
setxbmap tr &

# Display (DONE BUT NEED TO EDIT)
#xrandr --output LVDS1 --mode 1366x768 --output VGA1 --mode 1600x900 --right-of LVDS1

# XFCE polkit
/usr/lib/xfce-polkit/xfce-polkit &

# Wallpaper
feh --bg-scale Wallpapers/arch.png &

# While loop
while true; do
	dwm >/dev/null 2>&1
done

# DWM
exec dwm




