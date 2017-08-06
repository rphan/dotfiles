#
# File:     .bash_profile
# Author:   Bob Phan
#
# Description:
#   This file gets loaded at every login session.  I always use --login with
#   my xterms, so every time I open a term I will source this file.
#

export CLICOLOR=1
export CLICOLOR_FORCE=1
export MANPAGER="less"
export HISTIGNORE="&:ls:[bf]g:exit"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.tar=01;31:*.tgz=01;31:*.tbz2=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lha=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:*.tiff=01;35:';

# Spell suggestions on misspelled cd commands
shopt -s cdspell
shopt -s checkwinsize

if [ -f /usr/local/etc/bash_completion ]; then
    source /usr/local/etc/bash_completion
fi
source "$HOME/.alias"
source "$HOME/.prompt"

export EDITOR=nvim
set -o vi

# Load .bashrc
# XXX --- THIS MUST ALWAYS BE LAST --- XXX
source $HOME/.bashrc
