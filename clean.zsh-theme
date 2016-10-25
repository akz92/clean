autoload -Uz vcs_info
autoload -U colors && colors
setopt promptsubst

zstyle ':vcs_info:*' formats '%b'

precmd () {
  vcs_info

  STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)

  if [[ -n $STATUS ]]; then
    local git_branch='%F{red}$vcs_info_msg_0_'
  else
    local git_branch='%F{green}$vcs_info_msg_0_'
  fi

  RPROMPT="${git_branch}"

  if [ "$ZSH_CLEAN_PATH_STYLE" = "1" ]; then
    PROMPT="%F{blue}%c "
  else
    PROMPT="%F{blue}%~ "
  fi
}

