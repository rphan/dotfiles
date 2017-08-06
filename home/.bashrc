#
# File:     .bashrc
# Author:   Bob Phan
#
# Description:
#
#   This file gets loaded any time a shell is opened.  This does not
#   necessarily mean interactive shells.  The only things that should
#   go in this file are variables and other settings that will apply
#   silently.
#
export PATH="$HOME/bin:$PATH"
export UMASK=027 # rwxr-x---

export HOMESHICK_DIR=/usr/local/opt/homeshick
source "$HOMESHICK_DIR/homeshick.sh"
