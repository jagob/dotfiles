# echo '       \_\_    _/_/'
# echo '           \__/'
# echo '           (oo)\_______'
# echo '           (__)\       )\/\'
# echo '               ||----w |'
# echo '               ||     ||'
#
source ~/dotfiles/.zshgit
source /usr/share/autojump/autojump.zsh
# source /usr/share/zsh/plugins/zsh-extract/extract.plugin.zsh
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh/plugins/dirhistory/dirhistory.plugin.zsh
# source /usr/share/zsh/plugins/copybuffer/copybuffer.plugin.zsh
# source /usr/share/zsh/plugins/copypath/copypath.plugin.zsh
autoload -U promptinit compinit
compinit        # autocompletion
promptinit
# xset -b # disable pc speaker locally

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
export PATH=~/bin:$PATH
export PIP_REQUIRE_VIRTUALENV=false
export PYTHONBREAKPOINT="ipdb.set_trace"

#suffix-alias
alias -s tex=$EDITOR
alias -s c=$EDITOR
alias -s h=$EDITOR
alias -s asm=$EDITOR
alias -s txt=$EDITOR

# aliases
alias vim='nvim'  # \vim will ignore the alias
alias vimdiff='nvim -d'
alias za='zathura'
alias fp='readlink -f'  # filepath
alias finder='find -name' # "search"
alias foldersize='du -cksh *'
alias suspend='systemctl suspend'
alias sc="systemctl"
alias bt='sudo systemctl start bluetooth'
alias activate='source env/bin/activate'
alias xres='xrdb -load ~/.Xresources'
alias keyboard='setxkbmap -layout dk; setxkbmap -option caps:escape'
alias keeb='setxkbmap -layout dk; setxkbmap -option caps:escape'
alias bc='bc -lq'						# bash calculator with floating point
alias bell='sleep 3; echo -e "\a"' 
alias randomgenerator='cd ~/code/randomgenerator && python2 randomgenerator.py'

# servers

# monitors
# alias monitor_off='xrandr --output HDMI-2 --off'
alias monitor='xrandr --output eDP-1 --auto --output HDMI-1 --off'
# alias monitor1='xrandr --output eDP-1 --auto --output DVI-I-1-1 --auto --output DVI-I-2-2 --off'
# alias monitor_default='xrandr --output eDP-1 --auto --output DVI-I-1-1 --off --output DVI-I-2-2 --off'
# alias monitor_reset='xrandr --output eDP-1 --auto --output DVI-I-1-1 --off --output DVI-I-2-2 --off'

# documents
alias todo='vim ~/dropbox/faldkasse/notes/todo.txt'
alias work='vim ~/dropbox/faldkasse/notes/work.txt'
alias notes='vim ~/dropbox/faldkasse/notes/notes.txt'
alias oensker='vim ~/dropbox/faldkasse/notes/oenskeseddel.txt'
alias binds='vim ~/dropbox/faldkasse/privat/cfg/keymaps/jagob/keymap.c'
alias miryoku='vim ~/dropbox/faldkasse/privat/cfg/keymaps/jagob_miryoku/keymap.c'

alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"

alias l='ls'
alias ls='ls -h --color --group-directories-first'
alias sl='ls'
alias lt='ls -ltgG' 		            # sort by last modified
alias llt='ls -ltgG' 		            # sort by last modified
alias ll="ls -lvgG"
alias la='ls -A'                        # list all files w/o attributes
alias lla="ls -AlvgG"
alias lt='ls -ltgG' 		            # sort by last modified
alias lx='ls -lXB'                      #  Sort by extension
alias c='cd "$@" && ls'
alias grep='grep -i --color'

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

alias cd..='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias sd='sudo shutdown -h now'         # shutdown
alias rs='sudo shutdown -r now'         # restart
alias rb='sudo shutdown -r now'         # restart

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

# bindkey "\033[a6i" backward-delete-word
# bindkey "\033[1;2A6i" backward-delete-word

# bindkey "\033[33~" backward-delete-word
# bindkey "\033[18;2~" backward-delete-word
# bindkey -r "\033[33~"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('~/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "~/miniconda3/etc/profile.d/conda.sh" ]; then
        . "~/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="~/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# zsh-syntax-highlighting at the end of file
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
typeset -A ZSH_HIGHLIGHT_STYLES
# ZSH_HIGHLIGHT_STYLES[arg0]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#fabd2f'  # yellow
