cd
mkdir -p downloads documents .config/zathura .local/share/applications/

ln -s ~/dotfiles/.xinitrc .
ln -s ~/dotfiles/.xmonad .
ln -s ~/dotfiles/.Xresources .
ln -s ~/dotfiles/.zshrc .
ln -s ~/dotfiles/.vimrc .
ln -s ~/dotfiles/.vim .
ln -s ~/dotfiles/.tmux.conf .
ln -s ~/dotfiles/.pylintrc .
ln -s ~/dotfiles/.config/nvim .config/
ln -s ~/dotfiles/.config/flake8 .config/
ln -s ~/dotfiles/.gitconfig .
ln -s ~/dotfiles/bin .
ln -s ~/dotfiles/zathurarc .config/zathura/
# ln -s ~/dotfiles/.vifm .
# ln -s ~/dotfiles/.stalonetrayrc .
# ln -s ~/dotfiles/vim-urxt.desktop ~/.local/share/applications/
ln -s ~/.Dropbox/Dropbox dropbox

cp ~/dotfiles/vim-urxt.desktop ~/.local/share/applications/

sudo pacman -S xorg-devel xorg-xinit

# xmonad
sudo pacman -S xmonad xmonad-contrib dzen2 conky trayer xdotool

# essentials
sudo pacman -S gvim git less wget rxvt-unicode urxvt-perls ttf-ubuntu-mono-nerd

# neovim
sudo pacman -S neovim python-pip python-pynvim ripgrep npm rust lazygit

# audio
sudo pacman -S pipewire pavucontrol

# Post installation
sudo pacman -S zsh zsh-autosuggestions zsh-syntax-highlighting tmux htop firefox dmenu arandr autorandr zathura zathura-pdf-poppler evince eog eog-plugins vlc vim-spell-da feh nm-connection-editor network-manager-applet networkmanager-openconnect gnome-keyring openssh flake8 unzip thunar thunar-archive-plugin file-roller thunar-volman gvfs tumbler ffmpegthumbnailer cifs-utils xfce4-notifyd cups cups-pdf system-config-printer jupyterlab jupyter-notebook ntp ctags fzf ack ttf-liberation

# academia
texlive-most vim-latexsuite 


chsh -s $(which zsh)

# # extra
# sudo pacman -Ss flashplugin tumbler okular gst-libav vlc lib32-libpulse jre7-openjdk jdk7-openjdk icedtea-web inkscape gimp ntfs-3g wine wine-mono wine_gecko lib32-ncurses cups cups-pdf system-config-printer samba xorg-xrandr ncmpcpp mpd mpc libreoffice-still cmake opencv ffmpeg ipython2 python2-ipdb python2-pygame python2-numpy python2-scipy python2-matplotlib python2-pyqt4 python2-h5py flake8 wxpython python2-pyzmq python2-jinja python2-tornado youtube-dl cheese tk irssi wmctrl lxappearance lynx maven bc gmrun offlineimap xfce4 xfce4-notifyd inotify-tools mutt mpg123
# # outdated: gvfsin 

sudo pacman -S makepkg
cd downloads
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

yay -S xcursor-human urxvt-resize-font-git rxvt-unicode-truecolor-wide-glyphs dropbox teams zotero spotify autojump zsh-extract-git wps-office openprinting-ppds-pxlcolor-generic gruvbox-dark-gtk betterlockscreen
# teams black screen on screen share
sudo mv /usr/share/teams/resources/app.asar.unpacked/node_modules/slimcore/bin/ rect-overlay /usr/share/teams/resources/app.asar.unpacked/node_modules/slimcore/bin/rect-overlay.bak


# outdated aur packages
# yay -S xcursor-human ttf-ms-fonts ttf-ubuntu-mono-derivative-powerline dropbox dropbox-cli gnome-keyring-query urlview pdfjumbler urxvt-font-size-git openprinting-ppds-pxlcolor-generic google-chrome ttf-ubuntu-mono-derivative-powerline skypeforlinux-stable-bin skype
# gcc-multilib fremfor regulær gcc 

# mouse cursor
sudo pacman -S xorg-xsetroot
git -C ~/downloads clone https://github.com/yeyushengfan258/Polarnight-Cursors
cp -r ~/downloads/Polarnight-Cursors/dist ~/.local/share/icons/Polarnight-Cursors
rm -rf ~/downloads/Polarnight-Cursors

git -C ~/downloads clone https://github.com/yeyushengfan258/Future-cursors
cp -r ~/downloads/Future-cursors/dist ~/.local/share/icons/Future-cursors
rm -rf ~/downloads/Future-cursors

# touch ~/.mpd/{database,log,pid,state,sticker.sql,errorlog}

# mkdir -p ~/.mail ~/.mail/jacobgmail ~/.mail/aau
# echo 'mailboxes "+jacobgmail/INBOX" "+jacobgmail/[Gmail].Sent Mail" "+jacobgmail/gemte" "+jacobgmail/Drafts" "+jacobgmail/Trash"' > ~/.mail/jacobgmail/mailboxes
# echo 'mailboxes "+aau/INBOX" "+aau/Sent Items" "+aau/Drafts"' > ~/.mail/aau/mailboxes

# sudo systemctl enable ntpd

# Desktop
# sudo pacman -S nvidia
