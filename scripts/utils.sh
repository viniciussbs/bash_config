# reload source
reload() {
  source ~/.bashrc;
}

_repo() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts="clone list open path remove new"

  case "${prev}" in
    o|open)
      local repos=$(ls ~/code)
      COMPREPLY=( $(compgen -W "${repos}" -- ${cur}) )
      return 0
      ;;
    rm|remove)
      local repos=$(ls ~/code)
      COMPREPLY=( $(compgen -W "${repos}" -- ${cur}) )
      return 0
      ;;
    *)
    ;;
  esac

  if [[ "$COMP_CWORD" == 1 ]]; then
    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
  fi

  return 0
}

#  repo path
#  repo list
#  repo new
#  repo open [repo_name]
#  repo remove [repo_name]
#  repo clone [git_endpoint]
repo() {
  case "$1" in
    path)
      echo "$HOME/code"
      return 0
      ;;
    l|ls|list)
      \ls -1 ~/code
      return 0
      ;;
    o|open)
      cd ~/code/$2
      return 0
      ;;
    n|new)
      mkdir -p ~/code/$2
      repo o $2
      return 0
      ;;
    rm|remove)
      if [[ "$2" != '' ]]; then
        read -r -p "Remove repo $2? [yes/no] " response
        case $response in
          [yY][eE][sS])
            rm -rf ~/code/$2
            echo "Repo $2 removed."
            ;;
          *)
          ;;
        esac
      fi
      return 0
      ;;
    c|clone)
      cd ~/code
      git clone $2 $3
      local repo
      if [[ "$3" != '' ]]; then
        repo="$3"
      else
        if [[ "$2" =~ \/(.*)\.git$ ]]; then
          repo="${BASH_REMATCH[1]}"
        fi
      fi
      echo "New repo $repo."
      return 0
      ;;
    *)
    ;;
  esac
}

complete -F _repo repo

see() {
  qlmanage -p "$@" &>/dev/null
}

latest() {
    if [[ "$1" != '' ]]; then
        echo "$1$(ls -rt $1 | tail -n1)"
    else
        echo "$(ls -rt | tail -n1)"
    fi
}

abs_path() {
    if [[ "$1" != '' ]]; then
        echo "$(pwd)/$1"
    else
        local stdin
        stdin=$(cat)
        echo "$(pwd)/$stdin"
    fi
}
