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

# export XCURSOR_THEME="Your_Cursor_Theme_Name"
# export XCURSOR_SIZE="24"

autorandr --change
xrdb -merge ~/.Xresources
setxkbmap -layout dk; setxkbmap -option caps:escape
xsetroot -cursor_name left_ptr
xset s 3600 3600                                        # screen blackout in one hour
# xset dpms 0 0 0                                       # disable display power management system
xset dpms 3800 3800 3800
# xmodmap -e "keysym Alt_L = Meta_L Alt_L"
# xmodmap ~/.Xmodmap
# amixer set "Speaker" unmute 100% > /dev/null
# feh --bg-scale /home/jacob/Dropbox/faldkasse/wallpapers/woods.jpg

# if [ -x /usr/bin/xfce4-power-manager ] ; then
#    xfce4-power-manager
# fi

/usr/bin/nm-applet --sm-disable &
sleep 5 && /usr/bin/dropbox &
polybar main -c ~/.config/polybar/config.ini &
# trayer --edge top --align left --margin 1150 --SetDockType true --SetPartialStrut true --expand true --widthtype request --heighttype pixel --height 24 --transparent true --alpha 0 --tint 0x1a1a1a &

exec xmonad
