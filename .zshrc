echo 'read .zshrc'
export ZUSERDIR=$HOME/.zsh

# まだ書き上がってないため、一旦読み込まない
[[ -f $ZUSERDIR/user ]] && source $ZUSERDIR/user
[[ -f $ZUSERDIR/aliases ]] && source $ZUSERDIR/aliases
