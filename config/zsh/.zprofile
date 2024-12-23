export TERM=xterm-256color

export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:$HOME/dotfiles/bin
export PATH=$PATH:$HOME/.local/bin

export DOTFILES_DIR=$HOME/dotfiles
setopt nullglob
for file in "$DOTFILES_DIR/local/"*.sh; do
    source "$file"
done
unsetopt nullglob
