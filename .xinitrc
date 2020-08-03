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
setxkbmap -layout dk; setxkbmap -option caps:escape
xsetroot -cursor_name left_ptr
# xmodmap -e "keysym Alt_L = Meta_L Alt_L"
export EDITOR=vim
# xmodmap ~/.Xmodmap

if [ -x /usr/bin/xfce4-power-manager ] ; then
   xfce4-power-manager
fi

# if [ -x /usr/bin/nm-applet] ; then
#    nm-applet --sm-disable &
# fi
nm-applet --sm-disable

dropbox
# sleep 15 && /usr/bin/offlineimap -u quiet &
#sleep 25 && /home/jacob/bin/offlineimap-daemon.py &
#sleep 30 && /usr/bin/urxvt -e /usr/bin/mutt &
#sleep 35 && /usr/bin/urxvt -e /usr/bin/irssi &
# /home/jacob/.xmonad/dzen2/start_apps &
# stalonetray &
amixer set "Speaker" unmute 100% > /dev/null

# xrandr --output DVI-I-0 --auto --output DVI-I-3 --primary --auto --right-of DVI-I-0 --output HDMI-0 --off

# trayer --edge top --align left --margin 1150 --SetDockType true --SetPartialStrut true --expand true --widthtype request --heighttype pixel --height 24 --transparent true --alpha 0 --tint 0x1a1a1a &

feh --bg-scale /home/jacob/Dropbox/faldkasse/wallpapers/penguins.jpg

# exec startxfce4
exec xmonad
