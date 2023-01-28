#### Setup on SSH connections

 - bin/git_diff_wrapper 
 - bin/diffwrap.sh
 - .gitconfig?

```
cp dotfiles/.bashrc ~
cp dotfiles/.vimrc ~
cp dotfiles/.vim/plugins.vim ~/.vim/
cp dotfiles/.tmux.conf ~
mkdir ~/code ~/datasets ~/models
mkdir -p ~/.vim/colors
cp dotfiles/.vim/colors/jagob-gruvbox.vim ~/.vim/colors
sudo apt-get install exuberant-ctags ack fzf ripgrep silversearcher-ag
```
