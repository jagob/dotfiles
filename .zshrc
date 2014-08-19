autoload -U promptinit compinit
compinit        # autocompletion
promptinit

#Misc settings
bindkey -e #use emacs keybindings
# prompt bigfade
prompt=$'%{\e[1;32m%}%~> %{\e[0m%}' # Custom Prompt settings

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
setopt completealiases    # autocompletion of command line switches for aliases 
setopt noflowcontrol        
# setopt extendedGlob
setopt correct          # try to correct spelling of commands
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.
setopt complete_in_word         # allow completion from within a word/phrase
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
export WORDCHARS='' #Treat all special chars as word separators
export MATLABPATH='/home/jacob/.matlab'
export MPD_HOST=/home/jacob/.mpd/socket
export BROWSER=/usr/bin/google-chrome-stable

#suffix-alias
alias -s tex=$EDITOR
alias -s c=$EDITOR
alias -s h=$EDITOR
alias -s asm=$EDITOR
alias -s txt=$EDITOR

#aliases
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -A'                        # list all files w/o attributes
alias lt='ls -ltgG' 		            # sort by last modified
alias sd='sudo shutdown -h now'         # shutdown
alias xres='xrdb -load ~/.Xresources'


alias quakelive="LD_PRELOAD='/usr/lib/libpng12.so' /usr/bin/firefox www.quakelive.com"
alias aaussh='ssh pejor@skoda.es.aau.dk -X'
alias lundssh='ssh guest@lundgaard.dyndns.dk'
alias latexmkrapport="ls *.latexmain | xargs latexmk -pdf -pvc -silent"
alias ise='LD_PRELOAD=/home/peter/Desktop/usb-driver/libusb-driver.so /opt/xilinx/11.1/ISE/bin/lin/ise'
alias impact='LD_PRELOAD=/home/peter/Desktop/usb-driver/libusb-driver.so /opt/xilinx/11.1/ISE/bin/lin/impact'
alias drp2='cvlc http://live-icy.gss.dr.dk:8000/A/A04H.mp3.m3u'
alias drp3='cvlc http://live-icy.gss.dr.dk:8000/A/A05H.mp3.m3u'
alias drp4nord='cvlc http://live-icy.gss.dr.dk:8000/A/A10H.mp3.m3u'
alias drp6='cvlc http://live-icy.gss.dr.dk:8000/A/A29H.mp3.m3u'
alias drp8='cvlc http://live-icy.gss.dr.dk:8000/A/A22H.mp3.m3u'
alias drjazz='drp8'
alias koqx='cvlc http://www.koqx.com/koqx.m3u'

###COLORS
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

########################

#key bindings for compatibility with terminal emus
# arrow up
bindkey "\e[A" history-beginning-search-backward-end    #Up Arrow 
bindkey "\e[B" history-beginning-search-forward-end     #Down Arrow
####################### key bindings from archwiki
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char         # Del key 
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word   # control + right arrow 
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word  # control + left arrow 
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "^H" backward-delete-word   # control + backspace 
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

# Color Script
typeset -Ag FX FG BG

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done

ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-Arma virumque cano Troiae qui primus ab oris}

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %F{$code}$ZSH_SPECTRUM_TEXT%f"
  done
}

# Show all 256 colors where the background is set to specific color
function spectrum_bls() {
  for code in {000..255}; do
    print -P -- "$BG[$code]$code: $ZSH_SPECTRUM_TEXT %{$reset_color%}"
  done
}
