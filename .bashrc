
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\w #\\[$(tput sgr0)\\]"
else # normal
  PS1="\[\033[0;92m\]\342\226\210\342\226\210 \[\e[0;92m\][\W] \$\[\e[0m\] "
  # PS1=" \[\e[0;92m\][\w] \$\[\e[0m\] "
fi

# Bind Ctrl-s in vim to save
bind -r '\C-s'
stty -ixon

alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias sl='ls'
alias bc='bc -l'						# bash calculator with floating point
alias sd='sudo shutdown -h now'                                   # shutdown
alias rs='sudo shutdown -r now'                                   # restart
alias rb='sudo shutdown -r now'                                   # restart
# sudo shutdown -hP now #shutdown and power off the system now
# export RUNLEVEL=0 && halt


alias :q='logout'
# alias pl='sudo /etc/cron.daily/prelink'                           # prelink
alias ls='ls -h --color --group-directories-first'
alias ll="ls -lvgG"
alias la='ls -A'                 # list all files w/o attributes
alias lla="ls -AlvgG"
alias lt='ls -ltgG' 		# sort by last modified
alias lx='ls -lXB'         #  Sort by extension

alias svns='svn status'											  # gets svn status
alias svnu='svn update'						  # updates from svn
alias svna='svn add . --force'
alias svnc='svn commit -m ""'						  # commits to svn
alias svnf='cd ~/documents/svn/p6/rep/'
alias svnl='svn log -v -l 5'							  # gets log from svn

alias matlaber='matlab -nodesktop -nosplash'
alias xres='xrdb -load ~/.Xresources'
alias win='sudo mount /dev/sda2 /mnt/windows'
alias wc3='cd ~/spil/"Warcraft III til lan" && wine "Frozen Throne.exe" -opengl -window'
alias gitlog='cd ~/documents/darwinduck/ && git log --graph --abbrev-commit'
alias bell='sleep 3; echo -e "\a"' # only works when typed in terminal
alias todo='vim ~/dropbox/faldkasse/todo.txt'
alias dropperen='cd ~/dropbox/uni/P6'
alias arch='vim ~/dropbox/faldkasse/linux/arch.txt'
alias linux='vim ~/dropbox/faldkasse/linux/linux.txt'
alias rescaleove='for i in $( ls *.jpg); do convert -resize 30% $i $i; done'
alias ubuntu='vim ~/dropbox/faldkasse/linux/ubuntu.txt'
alias vimmer='cd documents/vimmer/ && vim -o3 c.c matlab.m latex.tex'
alias random='cd ~/dropbox/uni/P6/bras/randomgenerator/ && python2 randomgenerator.py'
alias byg='latexmk -pdf -pvc masterlocal.tex'
alias za='zathura'
alias mus='sudo sensei-raw-ctl --cpi-on 900 --cpi-off 1000'
alias finder='find -name'

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

# # set dual monitors
# dual () {
#     xrandr --output VGA-0 --primary --left-of HDMI-0 --output HDMI-0 --auto
# }
# 
# # set single monitor
# single () {
#     xrandr --output HDMI-0 --off
# }
