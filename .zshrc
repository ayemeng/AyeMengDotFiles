######################################################################
#		      AyeMeng's custom .zshrc 
######################################################################

#---------------------------------------------------------------------
# Functions
#---------------------------------------------------------------------
autoload -U compinit
compinit
autoload -U promptinit
promptinit

#---------------------------------------------------------------------
# Environment
#---------------------------------------------------------------------
setopt ALL_EXPORT
HISTSIZE=2000
HISTFILE="$HOME/.history"
SAVEHIST=$HISTSIZE
unsetopt ALL_EXPORT

#---------------------------------------------------------------------
# Enable options
#---------------------------------------------------------------------
# Correct typos
setopt CORRECTALL
# Append to history
setopt INC_APPEND_HISTORY 
# Ignore commands staring with a " "
setopt HIST_IGNORE_SPACE
# Auto 'cd'
setopt AUTOCD
# Share history between sessions
setopt SHARE_HISTORY
# Improved globbing 
setopt EXTENDEDGLOB

#---------------------------------------------------------------------
# Styles
#---------------------------------------------------------------------
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

#---------------------------------------------------------------------
# Alias
#---------------------------------------------------------------------
alias c="clear"
alias l='ls -lGhF'
alias ll='ls -al'
alias x="exit"
#---------------------------------------------------------------------
# Prompt
#---------------------------------------------------------------------
export PROMPT="%B% %F{green}%m%f  %F{magenta}%~%f%b
%# "
export RPROMPT="%F{blue}%@%f"


