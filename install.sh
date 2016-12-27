cd

mkdir downloads documents music work .Dropboxdata 

ln -s ~/dotfiles/.xinitrc .
ln -s ~/dotfiles/.xmonad .
ln -s ~/dotfiles/.stalonetrayrc .
ln -s ~/dotfiles/.Xresources .
ln -s ~/dotfiles/.zshrc .
ln -s ~/dotfiles/.vimrc .
ln -s ~/dotfiles/.vim .
ln -s ~/dotfiles/.gitconfig .
ln -s ~/dotfiles/.mutt .
ln -s ~/dotfiles/.offlineimaprc .
ln -s ~/dotfiles/.irssi .
ln -s ~/dotfiles/.mpd .
ln -s ~/dotfiles/.ncmpcpp .
ln -s ~/dotfiles/bin .
ln -s ~/dotfiles/zathurarc .
ln -s ~/dotfiles/vim-urxt.desktop ~/.local/share/applications/


sudo pacman -S zsh htop firefox flashplugin unzip thunar-archive-plugin file-roller gvfs thunar-volman tumbler ntp texlive-most vim-latexsuite zathura zathura-pdf-poppler evince kdegraphics-okular gst-libav vim-spell-da vlc lib32-libpulse jre7-openjdk jdk7-openjdk icedtea-web inkscape gimp ntfs-3g wine wine-mono wine_gecko lib32-ncurses feh eog cups cups-pdf system-config-printer samba xorg-xrandr arandr ncmpcpp mpd mpc libreoffice-still cmake opencv ffmpeg ipython2 python2-ipdb python2-pygame python2-numpy python2-scipy python2-matplotlib python2-pyqt4 python2-h5py flake8 wxpython python2-pyzmq python2-jinja python2-tornado youtube-dl cheese tk irssi wmctrl lxappearance lynx maven bc gmrun offlineimap xfce4 gvfsin xfce4-notifyd inotify-tools autojump dmenu mutt mpg123

git clone https://aur.archlinux.org/package-query.git && cd package-query && makepkg && sudo pacman -U *.pkg.tar.xz

git clone https://aur.archlinux.org/yaourt.git && cd yaourt && makepkg && sudo pacman -U *.tar.xz

yaourt -S --noconfirm xcursor-human ttf-ms-fonts dropbox dropbox-cli gnome-keyring-query urlview pdfjumbler urxvt-font-size-git openprinting-ppds-pxlcolor-generic google-chrome skype

chsh -s $(which zsh)

touch ~/.mpd/{database,log,pid,state,sticker.sql,errorlog}




mkdir -p ~/.mail ~/.mail/jacobgmail ~/.mail/aau
echo 'mailboxes "+jacobgmail/INBOX" "+jacobgmail/[Gmail].Sent Mail" "+jacobgmail/gemte" "+jacobgmail/Drafts" "+jacobgmail/Trash"' > ~/.mail/jacobgmail/mailboxes
echo 'mailboxes "+aau/INBOX" "+aau/Sent Items" "+aau/Drafts"' > ~/.mail/aau/mailboxes
