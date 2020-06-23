# Config X server for WSL
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

if [[ -d "/usr/lib/jvm/java-11-openjdk-amd64" ]]; then
  export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
fi

export ANDROID_HOME=/usr/local/opt/android-sdk
export ES_JAVA_OPTS="-Xms2g -Xmx2g"

PATH=/usr/local/heroku/bin:$PATH
PATH=~/.bash.d/scripts/utilities:$PATH
PATH=~/.emacs.d/bin:$PATH
export PATH=$PATH

export EDITOR="nano"

export HISTCONTROL=ignoredups
export HISTFILESIZE=1000000
export HISTIGNORE="history"
export HISTSIZE=${HISTFILESIZE}

# export GREP_OPTIONS="--color=auto"
# export GREP_COLOR="4;33"

export LESS_TERMCAP_mb=$'\E[04;33m'
export LESS_TERMCAP_md=$'\E[04;33m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[00;32m'
