# Editing

if [[ ! "$SSH_TTY" ]] && is_osx; then
  export EDITOR='atom -n -w'
  export LESSEDIT='mvim ?lm+%lm -- %f'
  export GIT_EDITOR='atom -n -w'
else
  export EDITOR='vim'
fi

export VISUAL="$EDITOR"

function q() {
  if [[ -t 0 ]]; then
    $EDITOR "$@"
    # pwd
    # if [[ "$1" ]]; then
    #   $EDITOR --servername "$PWD" --remote-silent "$@"
    # else
    #   $EDITOR --servername "$PWD" --remote-silent "$PWD"
    # fi
  else
    # Read from STDIN (and hide the annoying "Reading from stdin..." message)
    $EDITOR - > /dev/null
  fi
}
alias qv="q $DOTFILES/link/.{,g}vimrc +'cd $DOTFILES'"
alias qs="q $DOTFILES"
