__wesolve_prompt () {
  # Colors
  local BLACK="\[\033[0;30m\]"
  local RED="\[\033[0;31m\]"
  local GREEN="\[\033[0;32m\]"
  local ORANGE="\[\033[0;33m\]"
  local BLUE="\[\033[0;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local CYAN="\[\033[0;36m\]"
  local LIGHT_GREY="\[\033[1;37m\]"
  # Bright Colors
  local DARK_GREY="\[\033[1;30m\]"
  local LIGHT_RED="\[\033[0;31m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local YELLOW="\[\033[1;33m\]"
  local LIGHT_BLUE="\[\033[1;34m\]"
  local LIGHT_PURPLE="\[\033[1;35m\]"
  local LIGHT_CYAN="\[\033[1;36m\]"
  local WHITE="\[\033[1;37m\]"
  # Default Colors
  local NO_COLOR="\[\e[0m\]"
  local BASE_COLOR="$NO_COLOR"

  # Branch
  local BRANCH=`git branch 2> /dev/null | grep \* | sed 's/* //'`

  if [[ "$BRANCH" = "" ]]; then
    BRANCH=`git status 2> /dev/null | grep "On branch" | sed -E 's/^.*On branch //'`
  fi

  if [[ "$BRANCH" = "" ]]; then
    BRANCH=" $BRANCH"
  fi

  local STATUS=`git status 2> /dev/null | tr "\\n" " "`
  local PROMPT_COLOR=""
  local STATE=" "
  local NOTHING_TO_COMMIT="# Initial commit"
  local BEHIND="Your branch is behind"
  local AHEAD="Your branch is ahead"
  local UNTRACKED="Untracked files"
  local DIVERGED="have diverged"
  local CHANGED="Changed but not updated"
  local TO_BE_COMMITED="Changes to be committed"
  local CHANGES_NOT_STAGED="Changes not staged for commit"
  local LOG=`git log -1 2> /dev/null`

  if [ "$STATUS" != "" ]; then
    if [[ "$STATUS" =~ "$CHANGES_NOT_STAGED" ]]; then
      PROMPT_COLOR="${RED}"
      STATE=""
    elif [[ "$STATUS" =~ "$NOTHING_TO_COMMIT" ]]; then
      PROMPT_COLOR="${RED}"
      STATE=""
    elif [[ "$STATUS" =~ "$DIVERGED" ]]; then
      PROMPT_COLOR="${RED}"
      STATE="${STATE}${RED}↕${NO_COLOR}"
    elif [[ "$STATUS" =~ "$BEHIND" ]]; then
      PROMPT_COLOR="${RED}"
      STATE="${STATE}${RED}↓${NO_COLOR}"
    elif [[ "$STATUS" =~ "$AHEAD" ]]; then
      PROMPT_COLOR="${RED}"
      STATE="${STATE}${RED}↑${NO_COLOR}"
    elif [[ "$STATUS" =~ "$CHANGED" ]]; then
      PROMPT_COLOR="${RED}"
      STATE=""
    elif [[ "$STATUS" =~ "$TO_BE_COMMITED" ]]; then
      PROMPT_COLOR="${RED}"
      STATE=""
    else
      PROMPT_COLOR="${GREEN}"
      STATE=""
    fi

    if [[ "$STATUS" =~ "$UNTRACKED" ]]; then
      STATE="${STATE}${ORANGE}*${NO_COLOR}"
    fi

    PS1="
${LIGHT_CYAN}│ ${BASE_COLOR}\w\a${NO_COLOR} ${PROMPT_COLOR}${BRANCH}${NO_COLOR}${STATE}
${LIGHT_CYAN}│ ${NO_COLOR}\$ "
  else
    PS1="
${LIGHT_CYAN}│ ${BASE_COLOR}\w\a
${LIGHT_CYAN}│ ${NO_COLOR}\$ "
  fi
}

PROMPT_COMMAND=__wesolve_prompt
