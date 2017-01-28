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
<<<<<<< HEAD
export EDITOR=vim
||||||| merged common ancestors
# xmodmap -e "keysym Alt_L = Meta_L Alt_L"

# sh ~/.fehbg &
feh  --bg-scale 'pictures/80058-hardy_darkgreen.png' &


# trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --heighttype pixel --height 23 --transparent true --alpha 0 --tint 0x101010 &
# trayer --edge top --align right --margin 500 --SetDockType true --SetPartialStrut true --expand true --widthtype request --heighttype pixel --height 23 --transparent true --alpha 0 --tint 0x101010 &
trayer --edge top --align left --margin 1150 --SetDockType true --SetPartialStrut true --expand true --widthtype request --heighttype pixel --height 24 --transparent true --alpha 0 --tint 0x1a1a1a &

=======
export EDITOR=vim
xmodmap ~/.Xmodmap
>>>>>>> a88a6045245baa90b1c7cefb7b5f6b97fed100cc

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

sleep 10 && dropbox & 
# sleep 15 && /usr/bin/offlineimap -u quiet &
sleep 15 /home/jacob/bin/offlineimap-daemonctl.sh &
sleep 20 && /usr/bin/urxvt -e /usr/bin/mutt &
sleep 30 && /usr/bin/urxvt -e /usr/bin/irssi &
/home/jacob/.xmonad/dzen2/start_apps &
stalonetray &
# amixer set "Speaker" unmute 100% > /dev/null

xrandr --output DVI-I-0 --auto --primary --output DVI-I-3 --auto --right-of DVI-I-0 --output HDMI-0 --off

# feh --bg-scale /home/jacob/dropbox/faldkasse/jagob-delight.png &
# feh --bg-scale /home/jacob/downloads/animal_snout_lemur_cute_eyes_humor_funny_1920x1200.jpg &
feh --bg-scale /home/jacob/dropbox/faldkasse/wallpapers/chameleon_macro-wallpaper-2560x1440.jpg &

# exec startxfce4

# exec startxfce4
exec xmonad
