source ~/dotfiles/.zshgit
autoload -U promptinit compinit
compinit        # autocompletion
promptinit

#Misc settings
bindkey -e #use emacs keybindings
# prompt bigfade
PROMPT=$'%{\e[1;32m%}%~» %{\e[0m%}' # Custom Prompt settings
# Right hand prompt
RPROMPT='$(git_prompt_string) %*' 


#### History options
HISTFILESIZE=1000000000
HISTSIZE=10000000
SAVEHIST=100000000
HISTFILE=~/.zsh_history

# setopt extended_history     # save timestamp and duration
setopt hist_ignore_all_dups # no duplicate
setopt inc_append_history   # append instead of replace
setopt share_history        # share hist between sessions
setopt hist_no_functions
setopt completealiases      # autocompletion of command line switches for aliases 
setopt noflowcontrol        
# setopt extendedGlob
setopt correct              # try to correct spelling of commands
setopt list_ambiguous       # complete as much of a completion until it gets ambiguous.
setopt complete_in_word     # allow completion from within a word/phrase
stty -ixon

#### Completion
zstyle ':completion:*' rehash yes #always rehash external commands
zstyle ':completion:*' menu select #arrow key-driven completion
zstyle ':completion:*' special-dirs true	# allow cd ..
# allow approximate completion
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
#case-insensitive
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
#complete killall command
zstyle ':completion:*:processes' command 'ps -ax'
zstyle ':completion:*:processes-names' command 'ps -aeo comm='
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*' menu select
zstyle ':completion:*:*:killall:*:processes-names' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:killall:*' menu select

#Set terminal title to current working dir
#everytime prompt is shown
case $TERM in
	    xterm*|*rxvt*)
	precmd () {print -Pn "\e]0; %~\a"}
esac

#Environment variables
# export OOO_FORCE_DESKTOP=gnome
export EDITOR='vim'
# export WORDCHARS='' #Treat all special chars as word separators
# export MATLABPATH='/home/jacob/.matlab'
# export MPD_HOST=/home/jacob/.mpd/socket
export MPD_HOST="localhost"
export BROWSER=/usr/bin/firefox
export TERMINFO=/usr/share/terminfo
export PATH=/home/jacob/bin:$PATH

#suffix-alias
alias -s tex=$EDITOR
alias -s c=$EDITOR
alias -s h=$EDITOR
alias -s asm=$EDITOR
alias -s txt=$EDITOR

# aliases
alias xres='xrdb -load ~/.Xresources'
alias matlaber='matlab -nodesktop -nosplash'
alias mus='sudo sensei-raw-ctl --cpi-on 900 --cpi-off 1000'
alias randomgenerator='cd ~/code/randomgenerator && python2 randomgenerator.py'
alias quakelive='cd /home/jacob/.wine-ql/drive_c/Program\ Files/Quake\ Live/ && wine Launcher.exe'
alias win='sudo mount /dev/sda2 /mnt/windows'
alias za='zathura'
alias bc='bc -lq'						# bash calculator with floating point
alias bell='sleep 3; echo -e "\a"' 
alias todo='vim ~/dropbox/faldkasse/todo.txt'
alias p6='cd ~/dropbox/uni/P6'
alias arch='vim ~/dropbox/faldkasse/linux/arch.txt'
alias linux='vim ~/dropbox/faldkasse/linux/linux.txt'
alias ubuntu='vim ~/dropbox/faldkasse/linux/ubuntu.txt'
alias vimmer='cd /home/jacob/dropbox/faldkasse/linux/vimmer/ && vim -o3 c.c matlab.m latex.tex'
alias oensker='cd /home/jacob/dropbox/faldkasse/ && vim Oenskeseddel.txt'
alias wc3='cd ~/spil/"Warcraft III til lan" && wine "Frozen Throne.exe" -opengl -window'
alias finder='find -name' # "search"
alias updates="pacman -Qqu"
alias vmi='vim'
alias vimfm='vifm'
alias wordcount='pdftotext paper_IEEE.pdf - | wc -w'

alias ls='ls -h --color --group-directories-first'
alias sl='ls'
alias lt='ls -ltgG' 		            # sort by last modified
alias ll="ls -lvgG"
alias la='ls -A'                        # list all files w/o attributes
alias lla="ls -AlvgG"
alias lt='ls -ltgG' 		            # sort by last modified
alias lx='ls -lXB'                      #  Sort by extension

alias cd..='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias :q='logout'
alias sd='sudo shutdown -h now'         # shutdown
alias rs='sudo shutdown -r now'         # restart
alias rb='sudo shutdown -r now'         # restart

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias gitlog='git log --graph --abbrev-commit --name-status'
# alias gl  git log --graph --pretty=format:'%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --name-status

alias svns='svn status -u'				# gets svn status
alias svnu='svn update'				    # updates from svn
alias svna='svn add . --force'
alias svnc='svn commit -m ""'		    # commits to svn
alias svnf='cd ~/documents/svn/p6_2'
alias svnl='svn log -v -l 5'		    # gets log from svn


# Peter alias
# alias quakelive="LD_PRELOAD='/usr/lib/libpng12.so' /usr/bin/firefox www.quakelive.com"
# alias aaussh='ssh pejor@skoda.es.aau.dk -X'
# alias lundssh='ssh guest@lundgaard.dyndns.dk'
# alias latexmkrapport="ls *.latexmain | xargs latexmk -pdf -pvc -silent"
# alias ise='LD_PRELOAD=/home/peter/Desktop/usb-driver/libusb-driver.so /opt/xilinx/11.1/ISE/bin/lin/ise'
# alias impact='LD_PRELOAD=/home/peter/Desktop/usb-driver/libusb-driver.so /opt/xilinx/11.1/ISE/bin/lin/impact'
# alias drp2='cvlc http://live-icy.gss.dr.dk:8000/A/A04H.mp3.m3u'
# alias drp3='cvlc http://live-icy.gss.dr.dk:8000/A/A05H.mp3.m3u'
# alias drp4nord='cvlc http://live-icy.gss.dr.dk:8000/A/A10H.mp3.m3u'
# alias drp6='cvlc http://live-icy.gss.dr.dk:8000/A/A29H.mp3.m3u'
# alias drp8='cvlc http://live-icy.gss.dr.dk:8000/A/A22H.mp3.m3u'
# alias drjazz='drp8'
# alias koqx='cvlc http://www.koqx.com/koqx.m3u'

### COLORS
export GREP_COLOR="1;33"
eval `dircolors -b`
# Colored manpage
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#helperfunctions
###################################
function cl () {
   if [ $# = 0 ]; then
      cd && ll
   else
      cd "$*" && ll
   fi
}

function gca {
    git commit -a -m "${*}"
}


function history-search-end {
    integer ocursor=$CURSOR

    if [[ $LASTWIDGET = history-beginning-search-*-end ]]; then
      # Last widget called set $hbs_pos.
      CURSOR=$hbs_pos
    else
      hbs_pos=$CURSOR
    fi

    if zle .${WIDGET%-end}; then
      # success, go to end of line
      zle .end-of-line
    else
      # failure, restore position
      CURSOR=$ocursor
      return 1
    fi
}
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# \e escape key
# ^ control
####################### key bindings from archwiki
bindkey "\e[1~" beginning-of-line   # control + a
bindkey "\e[4~" end-of-line         # control + e
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char         # Del key 
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word       # alt + f
bindkey "\e[5D" backward-word      # alt + b
bindkey "^j"    backward-word      # control j
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\eOc" emacs-forward-word   # control + right arrow 
bindkey "\eOd" emacs-backward-word  # control + left arrow 
bindkey "^H" backward-delete-word   # control + backspace 

#key bindings for compatibility with terminal emus
bindkey "\e[A" history-beginning-search-backward-end    #Up Arrow 
bindkey "\e[B" history-beginning-search-forward-end     #Down Arrow
# for rxvt
bindkey "\e[8~" end-of-line         # End key 
bindkey "\e[7~" beginning-of-line   # Home key 
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
##############################


echo '       \_\_    _/_/'
echo '           \__/'
echo '           (oo)\_______'
echo '           (__)\       )\/\'
echo '               ||----w |'
echo '               ||     ||'
