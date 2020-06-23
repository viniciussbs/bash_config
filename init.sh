# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

source $HOME/.bash.d/scripts/alias.sh
source $HOME/.bash.d/scripts/export.sh
source $HOME/.bash.d/scripts/options.sh
source $HOME/.bash.d/scripts/git_completion.sh
source $HOME/.bash.d/scripts/utils.sh
source $HOME/.bash.d/scripts/prompt.sh

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
