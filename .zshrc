echo '       \_\_    _/_/'
echo '           \__/'
echo '           (oo)\_______'
echo '           (__)\       )\/\'
echo '               ||----w |'
echo '               ||     ||'

source /usr/share/autojump/autojump.zsh
source ~/dotfiles/.zshgit
autoload -U promptinit compinit
compinit        # autocompletion
promptinit
xset -b # disable pc speaker locally

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
stty -ixon                  # Disable C-s from freezing terminal

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


#Environment variables
export EDITOR='vim'
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
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
alias ft='cd ~/documents/master/tracking/'
alias fd='cd ~/data/gopro/test/'
alias afs='cd /afs/ies.auc.dk/group/15gr940/no_backup'

alias suspend='systemctl suspend'
alias wordcount='pdftotext paper_IEEE.pdf - | wc -w'
alias wordcount2='detex introduction.tex | wc'
alias matlaber='matlab -nodesktop -nosplash'
alias za='zathura'
alias sc="systemctl"
alias win='sudo mount /dev/sda2 /mnt/windows'
alias xres='xrdb -load ~/.Xresources'
alias finder='find -name' # "search"
alias keyboard='setxkbmap -layout dk; setxkbmap -option caps:escape'
alias bc='bc -lq'						# bash calculator with floating point
alias bell='sleep 3; echo -e "\a"' 

alias mus='sudo sensei-raw-ctl --cpi-on 900 --cpi-off 1000'
alias randomgenerator='cd ~/code/randomgenerator && python2 randomgenerator.py'
alias wc3='cd ~/spil/"Warcraft III til lan" && wine "Frozen Throne.exe" -opengl -window'
alias quakelive='cd /home/jacob/.wine-ql/drive_c/Program\ Files/Quake\ Live/ && wine Launcher.exe'
alias todo='vim ~/dropbox/faldkasse/todo.txt'
alias arch='vim ~/dropbox/faldkasse/linux/arch.txt'
alias linux='vim ~/dropbox/faldkasse/linux/linux.txt'
alias notes='vim ~/dropbox/faldkasse/notes.txt'
alias oensker='vim /home/jacob/dropbox/faldkasse/Oenskeseddel.txt'
alias vimmer='cd /home/jacob/dropbox/faldkasse/linux/vimmer/ && vim -o3 c.c matlab.m latex.tex'
alias updates="pacman -Qqu"
alias vmi='vim'
alias vimfm='vifm'
alias aske='eog ~/downloads/cd.png & mpg123 ~/dropbox/faldkasse/soundboard/oioioi.mp3'

alias ls='ls -h --color --group-directories-first'
alias sl='ls'
alias lt='ls -ltgG' 		            # sort by last modified
alias ll="ls -lvgG"
alias la='ls -A'                        # list all files w/o attributes
alias lla="ls -AlvgG"
alias lt='ls -ltgG' 		            # sort by last modified
alias lx='ls -lXB'                      #  Sort by extension
alias c='cd "$@" && ls'
alias foldersize='du -cksh *'

alias cd..='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias :q='logout'
# alias sd='sudo systemctl stop openafs-client; sudo shutdown -h now'         # shutdown
alias sd='sudo shutdown -h now'         # shutdown
alias rs='sudo shutdown -r now'         # restart
alias rb='sudo shutdown -r now'         # restart

alias gs='git status'
alias gp='git pull'
alias go='git push'
alias ga='git add'
alias gaa='git add -A'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout'
alias gk='gitk --all&'
alias gx='gitx --all'
alias gitlog='git log --graph --abbrev-commit --name-status'
alias gl="git log --color --graph --pretty=format:'%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset - %Cred%h%Creset' --name-status"

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

function extract {
  echo Extracting $1 ...
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xjf $1  ;;
          *.tar.gz)    tar xzf $1  ;;
          *.bz2)       bunzip2 $1  ;;
          *.rar)       unrar x $1    ;;
          *.gz)        gunzip $1   ;;
          *.tar)       tar xf $1   ;;
          *.tbz2)      tar xjf $1  ;;
          *.tgz)       tar xzf $1  ;;
          *.zip)       unzip $1   ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1  ;;
          *)        echo "'$1' cannot be extracted via extract()" ;;
      esac
  else
      echo "'$1' is not a valid file"
  fi
}

#Set terminal title to current working dir
case $TERM in
	    xterm*|*rxvt*)
	precmd () {print -Pn "\e]0; %~\a"}
esac


# Bindkeys
bindkey -e #use emacs keybindings
bindkey -s '\e[13' 'urxvt& \C-m'

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
