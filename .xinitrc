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
export EDITOR=vim

# Gnome keyring
# Start a D-Bus session
# source /etc/X11/xinit/xinitrc.d/30-dbus
# Start GNOME Keyring
# eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# You probably need to do this too:
# export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK


if [ -x /usr/bin/xfce4-power-manager ] ; then
   xfce4-power-manager &
fi

if [ -x /usr/bin/xfce4-power-manager ] ; then
   nm-applet --sm-disable &
fi

feh --bg-scale /home/jacob/dropbox/faldkasse/jagob-delight.png &

sleep 10 && dropboxd & 
sleep 15 && /usr/bin/offlineimap -u quiet &
sleep 20 && /usr/bin/urxvt -e /usr/bin/mutt &
sleep 30 && /usr/bin/urxvt -e /usr/bin/irssi &
/home/jacob/.xmonad/dzen2/start_apps &
stalonetray &

# exec startxfce4
exec xmonad
