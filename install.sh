cd

mkdir downloads documents music .Dropboxdata 

ln -s ~/dotfiles/.xinitrc .
ln -s ~/dotfiles/.xmonad .
ln -s ~/dotfiles/.stalonetrayrc .
ln -s ~/dotfiles/.Xresoruces .
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

touch ~/.mpd/{database,log,pid,state,sticker.sql,errorlog}

mkdir -p ~/.mail ~/.mail/jacobgmail ~/.mail/aau
echo 'mailboxes "+jacobgmail/INBOX" "+jacobgmail/[Gmail].Sent Mail" "+jacobgmail/gemte" "+jacobgmail/Drafts" "+jacobgmail/Trash"' > ~/.mail/jacobgmail/mailboxes
echo 'mailboxes "+aau/INBOX" "+aau/Sent Items" "+aau/Drafts"' > ~/.mail/aau/mailboxes

sudo cp /etc/samba/smb.conf.default /etc/samba/smb.conf

