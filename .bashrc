
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\w #\\[$(tput sgr0)\\]"
else # normal
  PS1="\[\033[0;92m\]\342\226\210\342\226\210 \[\e[0;92m\][\w] \$\[\e[0m\] "
  # PS1=" \[\e[0;92m\][\w] \$\[\e[0m\] "
fi

# Bind Ctrl-s in vim to save
bind -r '\C-s'
stty -ixon

alias ..='cd ..'
alias cd..='cd ..'
alias sl='ls'
alias bc='bc -l'						# bash calculator with floating point
alias sd='sudo shutdown -h now'                                   # shutdown
alias rs='sudo shutdown -r now'                                   # restart
alias rb='sudo shutdown -r now'                                   # restart
alias :q='logout'
# alias pl='sudo /etc/cron.daily/prelink'                           # prelink
alias ls='ls -h --color'
alias ll="ls -lv --group-directories-first"
alias lh='ls -lh'                                                 # list files w/ attributes ( human-readable sizes )
alias l.='ls -d'	# list hidden files
alias la='ls -lA'                                                 # list all files w/o attributes
alias lah='ls -lah'                                               # list all files w/ attributes ( human-readable sizes )
alias lx='ls -lXB'         #  Sort by extension

alias svns='svn status'											  # gets svn status
alias svnu='svn update'						  # updates from svn
alias svna='svn add . --force'
alias svnc='svn commit -m ""'						  # commits to svn
alias svnf='cd ~/documents/svn/p5/report'
alias svnl='svn log -v -l 5'							  # gets log from svn

alias matlaber='matlab -nodesktop -nosplash'
alias xres='xrdb -load ~/.Xresources'
alias win='sudo mount /dev/sda2 /mnt/windows'
alias wc3='cd ~/spil/"Warcraft III til lan" && wine "Frozen Throne.exe" -opengl -window'
alias gitlog='cd ~/documents/darwinduck/ && git log --graph --abbrev-commit'
alias bell='sleep 3; echo -e "\a"' # only works when typed in terminal
alias todo='vim ~/dropbox/faldkasse/todo.txt'
alias arch='vim ~/dropbox/faldkasse/linux/arch.txt'
alias linux='vim ~/dropbox/faldkasse/linux/linux.txt'

# Enable gcc colors, in gcc 4.8 -->
#export GCC:COLORS=1

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


bind '"\e[11~": "urxvt &\n"'
