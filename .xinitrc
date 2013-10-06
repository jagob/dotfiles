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

xrdb -merge ~/.Xresources

setxkbmap -layout dk
setxkbmap -option caps:escape
xsetroot -cursor_name left_ptr

# sh ~/.fehbg &
feh  --bg-scale 'pictures/80058-hardy_darkgreen.png' &


# trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --heighttype pixel --height 23 --transparent true --alpha 0 --tint 0x101010 &
trayer --edge top --align right --margin 400 --SetDockType true --SetPartialStrut true --expand true --widthtype request --heighttype pixel --height 23 --transparent true --alpha 0 --tint 0x101010 &

if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi

if [ -x /usr/bin/xfce4-power-manager ] ; then
   sleep 3
   xfce4-power-manager &
fi

sleep 15 && dropboxd &


# exec gnome-session
# exec startkde
# exec startxfce4
exec xmonad
# ...or the Window Manager of your choice
