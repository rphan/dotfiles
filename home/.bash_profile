#
# File:     .bash_profile
# Author:   Bob Phan
#
# Description:
#   This file gets loaded at every login session.  I always use --login with
#   my xterms, so every time I open a term I will source this file.
#

source "$HOME/.bash_os_detect"

# Host specific bashrc {{{
#
# The purpose of the host specific bashrc is to set environment variables that
# you only need on this particular host.  bashrc gets sourced by interactive
# and non-interactive shells (like ssh host foo).  bashrc files should never
# have any output to the screen.
if [ -f "$HOME/$HOST_SPECIFIC_RC" ]; then
    source "$HOME/$HOST_SPECIFIC_RC"
else
    echo "Creating host specific bashrc: $HOME/$HOST_SPECIFIC_RC"
    cat << EOF > "$HOME/$HOST_SPECIFIC_RC"
#
# Host Specific .bashrc
#
# This is the very last file sourced, so anything written here
# will override any previously set option.
#
# This is a .bashrc file and will be sourced by non-interactive shells.
# Only put stuff in here that will execute silently.
#

EOF
fi
#}}}

#{{{ Keychain
if [ $DO_KEYCHAIN == 1 ]; then
    # Keychain makes passwordless authentication easy and safe
    if [ -e $HOME/keychain ]; then
        eval `$HOME/keychain -q --eval --agents ssh id_rsa`
    fi
fi #}}}

#{{{ Alias
#
# Keep aliases in a separate file, so I can resource
# them without reexecuting the rest of the commands in
# this file.
function re_alias { # I edit .alias often.  This makes it convenient.
    if [ -e $HOME/.alias ]; then
        source $HOME/.alias
    fi
}
re_alias
#}}}

# {{{Load bash completion
if [ $DO_BASH_COMPLETION == 1 ]; then
    if [ -e /etc/bash_completion ]; then
        source /etc/bash_completion
    elif [ -e /sw/etc/bash_completion ]; then
        source /sw/etc/bash_completion
    elif [ -f /usr/local/etc/bash_completion ]; then
        source /usr/local/etc/bash_completion
    fi
fi #}}}

export MANPAGER="less"
export HISTIGNORE="&:ls:[bf]g:exit"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.tar=01;31:*.tgz=01;31:*.tbz2=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lha=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:*.tiff=01;35:';
export EDITOR=vim

if [ $DO_VI_MODE == 1 ]; then
    set -o vi
fi

# Spell suggestions on misspelled cd commands
shopt -s cdspell
shopt -s checkwinsize

. $HOME/.prompt

# Load .bashrc
# XXX --- THIS MUST ALWAYS BE LAST --- XXX
source $HOME/.bashrc

#tab_title \[`hostname -s`\]

# vim:ft=sh:ts=4:sts=4:sw=4:fdm=marker
