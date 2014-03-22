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

export EDITOR=vim

xrdb -merge ~/.Xresources

setxkbmap -layout dk
setxkbmap -option caps:escape
xsetroot -cursor_name left_ptr
# xmodmap -e "keysym Alt_L = Meta_L Alt_L"

# sh ~/.fehbg &
feh  --bg-scale 'pictures/80058-hardy_darkgreen.png' &


# trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --heighttype pixel --height 23 --transparent true --alpha 0 --tint 0x101010 &
# trayer --edge top --align right --margin 500 --SetDockType true --SetPartialStrut true --expand true --widthtype request --heighttype pixel --height 23 --transparent true --alpha 0 --tint 0x101010 &
trayer --edge top --align left --margin 1150 --SetDockType true --SetPartialStrut true --expand true --widthtype request --heighttype pixel --height 24 --transparent true --alpha 0 --tint 0x1a1a1a &


# Gnome keyring
# Start a D-Bus session
source /etc/X11/xinit/xinitrc.d/30-dbus
# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# You probably need to do this too:
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK


if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi

if [ -x /usr/bin/xfce4-power-manager ] ; then
   sleep 3
   xfce4-power-manager &
fi

sleep 15 && dropboxd & 
sleep 15 && /usr/bin/urxvt -e /usr/bin/mutt &
sleep 30 && /usr/bin/urxvt -e /usr/bin/irssi &


# exec gnome-session
# exec startkde
# exec startxfce4
exec xmonad
# ...or the Window Manager of your choice
