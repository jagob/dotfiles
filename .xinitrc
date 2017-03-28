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
xmodmap ~/.Xmodmap

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

# if [ -x /usr/bin/network-manager] ; then
#    nm-applet --sm-disable &
# fi
nm-applet --sm-disable &

sleep 20 && dropbox & 
# sleep 15 && /usr/bin/offlineimap -u quiet &
sleep 25 && /home/jacob/bin/offlineimap-daemon.py &
sleep 30 && /usr/bin/urxvt -e /usr/bin/mutt &
sleep 35 && /usr/bin/urxvt -e /usr/bin/irssi &
/home/jacob/.xmonad/dzen2/start_apps &
stalonetray &
# amixer set "Speaker" unmute 100% > /dev/null

xrandr --output DVI-I-0 --auto --output DVI-I-3 --primary --auto --right-of DVI-I-0 --output HDMI-0 --off

# feh --bg-scale /home/jacob/dropbox/faldkasse/jagob-delight.png &
# feh --bg-scale /home/jacob/downloads/animal_snout_lemur_cute_eyes_humor_funny_1920x1200.jpg &
feh --bg-scale /home/jacob/dropbox/faldkasse/wallpapers/chameleon_macro-wallpaper-2560x1440.jpg &

# exec startxfce4
exec xmonad
