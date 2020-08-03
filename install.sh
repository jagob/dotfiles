cd

mkdir downloads documents

ln -s ~/dotfiles/.xinitrc .
ln -s ~/dotfiles/.xmonad .
ln -s ~/dotfiles/.stalonetrayrc .
ln -s ~/dotfiles/.Xresources .
ln -s ~/dotfiles/.zshrc .
ln -s ~/dotfiles/.vimrc .
ln -s ~/dotfiles/.vim .
ln -s ~/dotfiles/.gitconfig .
ln -s ~/dotfiles/bin .
ln -s ~/dotfiles/zathurarc .
ln -s ~/dotfiles/vim-urxt.desktop ~/.local/share/applications/
# ln -s ~/dotfiles/.mutt .
# ln -s ~/dotfiles/.offlineimaprc .
# ln -s ~/dotfiles/.irssi .
# ln -s ~/dotfiles/.mpd .
# ln -s ~/dotfiles/.ncmpcpp .

sudo pacman -S xorg xorg-xinit makepkg
# xmonad
sudo pacman -S xmonad xmonad-contrib dzen2 conky trayer xdotool
# audio
sudo pacman -S alsa alsa-utils pulseaudio pulseaudio-alsa pavucontrol
# essentials
sudo pacman -S vim rxvt-unicode ttf-ubuntu-font-family

# Post installation

# sudo pacman -S gvim zsh htop firefox dmenu thunar arandr zathura zathura-pdf-poppler evince eog texlive-most vim-spell-da vim-latexsuite 

# # extra
# sudo pacman -Ss flashplugin unzip thunar-archive-plugin file-roller gvfs thunar-volman tumbler ntp okular gst-libav vlc lib32-libpulse jre7-openjdk jdk7-openjdk icedtea-web inkscape gimp ntfs-3g wine wine-mono wine_gecko lib32-ncurses feh cups cups-pdf system-config-printer samba xorg-xrandr ncmpcpp mpd mpc libreoffice-still cmake opencv ffmpeg ipython2 python2-ipdb python2-pygame python2-numpy python2-scipy python2-matplotlib python2-pyqt4 python2-h5py flake8 wxpython python2-pyzmq python2-jinja python2-tornado youtube-dl cheese tk irssi wmctrl lxappearance lynx maven bc gmrun offlineimap xfce4 xfce4-notifyd inotify-tools autojump mutt mpg123


# # outdated: gvfsin 
# cd ~/downloads && git clone https://aur.archlinux.org/package-query.git && cd package-query && makepkg && sudo pacman -U *.pkg.tar.xz
# 
# cd ~/downloads && git clone https://aur.archlinux.org/yaourt.git && cd yaourt && makepkg && sudo pacman -U *.pkg.tar.xz
# 
# yay -S xcursor-human ttf-ubuntu-mono-derivative-powerline dropbox
# yaourt -S --noconfirm xcursor-human ttf-ms-fonts ttf-ubuntu-mono-derivative-powerline dropbox dropbox-cli gnome-keyring-query urlview pdfjumbler urxvt-font-size-git openprinting-ppds-pxlcolor-generic google-chrome 
# # skype gcc-multilib fremfor regulær gcc
# 
# 
# chsh -s $(which zsh)
# 
# touch ~/.mpd/{database,log,pid,state,sticker.sql,errorlog}
# 
# mkdir -p ~/.mail ~/.mail/jacobgmail ~/.mail/aau
# echo 'mailboxes "+jacobgmail/INBOX" "+jacobgmail/[Gmail].Sent Mail" "+jacobgmail/gemte" "+jacobgmail/Drafts" "+jacobgmail/Trash"' > ~/.mail/jacobgmail/mailboxes
# echo 'mailboxes "+aau/INBOX" "+aau/Sent Items" "+aau/Drafts"' > ~/.mail/aau/mailboxes
