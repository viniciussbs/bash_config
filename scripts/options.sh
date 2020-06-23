# ulimit -S -n 2048                         # increase the soft limit of max open files
# unset MAILCHECK                           # disable "you have mail" warning
# bind "set completion-ignore-case on"      # ignore case on bash completion
# bind "set mark-symlinked-directories on"  # add trailing slash to symlinked directories
# stty stop ^.                              # rebind freezing terminal to C-. and now C-s should work as i-search
# shopt -s histappend                       # append history instead of overwriting it

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# force commands that entered on more than one line to be adjusted to fit on only one
shopt -s cmdhist

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
