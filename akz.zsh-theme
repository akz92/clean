autoload -U colors && colors

git_prompt() {
 ref=$(git symbolic-ref HEAD | cut -d'/' -f3)
 echo $ref
}

PROMPT="%{$fg[blue]%}%~ "
RPROMPT="%{$fg[green]%}$(git_prompt)"
