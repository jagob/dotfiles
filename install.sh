cd

mkdir -p downloads documents .config .local/share/applications/

ln -s ~/dotfiles/.xinitrc .
ln -s ~/dotfiles/.xmonad .
ln -s ~/dotfiles/.stalonetrayrc .
ln -s ~/dotfiles/.Xresources .
ln -s ~/dotfiles/.zshrc .
ln -s ~/dotfiles/.vimrc .
ln -s ~/dotfiles/.vim .
ln -s ~/dotfiles/.pylintrc .
ln -s ~/dotfiles/.config/flake8 .config/
ln -s ~/dotfiles/.gitconfig .
ln -s ~/dotfiles/bin .
ln -s ~/dotfiles/zathurarc .
# ln -s ~/dotfiles/vim-urxt.desktop ~/.local/share/applications/
# ln -s ~/dotfiles/.mutt .
# ln -s ~/dotfiles/.offlineimaprc .
# ln -s ~/dotfiles/.irssi .
# ln -s ~/dotfiles/.mpd .
# ln -s ~/dotfiles/.ncmpcpp .

cp ~/dotfiles/vim-urxt.desktop ~/.local/share/applications/

sudo pacman -S xorg xorg-xinit
# xmonad
sudo pacman -S xmonad xmonad-contrib dzen2 conky trayer xdotool
# audio
sudo pacman -S alsa alsa-utils pulseaudio pulseaudio-alsa pavucontrol
# essentials
sudo pacman -S vim rxvt-unicode urxvt-perls ttf-ubuntu-font-family

# Post installation
sudo pacman -S gvim zsh htop firefox dmenu arandr zathura zathura-pdf-poppler evince eog vlc texlive-most vim-spell-da vim-latexsuite autojump feh nm-connection-editor network-manager-applet networkmanager-openconnect gnome-keyring wget openssh flake8 thunar thunar-archive-plugin file-roller tumbler ffmpegthumbnailer cifs-utils gvfs gvfs-smb xfce4-notifyd rclone cups cups-pdf system-config-printer 

chsh -s $(which zsh)

# # extra
# sudo pacman -Ss flashplugin thunar-volman tumbler ntp okular gst-libav vlc lib32-libpulse jre7-openjdk jdk7-openjdk icedtea-web inkscape gimp ntfs-3g wine wine-mono wine_gecko lib32-ncurses cups cups-pdf system-config-printer samba xorg-xrandr ncmpcpp mpd mpc libreoffice-still cmake opencv ffmpeg ipython2 python2-ipdb python2-pygame python2-numpy python2-scipy python2-matplotlib python2-pyqt4 python2-h5py flake8 wxpython python2-pyzmq python2-jinja python2-tornado youtube-dl cheese tk irssi wmctrl lxappearance lynx maven bc gmrun offlineimap xfce4 xfce4-notifyd inotify-tools mutt mpg123
# # outdated: gvfsin 


sudo pacman -S makepkg
cd downloads
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

yay -S xcursor-human dropbox teams zotero spotify wps-office openprinting-ppds-pxlcolor-generic
# teams black screen on screen share
sudo mv /usr/share/teams/resources/app.asar.unpacked/node_modules/slimcore/bin/ rect-overlay /usr/share/teams/resources/app.asar.unpacked/node_modules/slimcore/bin/rect-overlay.bak


# yaourt -S --noconfirm xcursor-human ttf-ms-fonts ttf-ubuntu-mono-derivative-powerline dropbox dropbox-cli gnome-keyring-query urlview pdfjumbler urxvt-font-size-git openprinting-ppds-pxlcolor-generic google-chrome ttf-ubuntu-mono-derivative-powerline skypeforlinux-stable-bin sky
# # skype gcc-multilib fremfor regulær gcc
# 
# 
# 
# touch ~/.mpd/{database,log,pid,state,sticker.sql,errorlog}
# 
# mkdir -p ~/.mail ~/.mail/jacobgmail ~/.mail/aau
# echo 'mailboxes "+jacobgmail/INBOX" "+jacobgmail/[Gmail].Sent Mail" "+jacobgmail/gemte" "+jacobgmail/Drafts" "+jacobgmail/Trash"' > ~/.mail/jacobgmail/mailboxes
# echo 'mailboxes "+aau/INBOX" "+aau/Sent Items" "+aau/Drafts"' > ~/.mail/aau/mailboxes
