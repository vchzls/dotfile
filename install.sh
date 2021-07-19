#!/bin/bash
chsh -s $(which zsh)

__dko_status() { printf '\033[0;34m==>       %s\033[0;m\n' "$1"; }

CDIR="$(dirname "$(readlink -f "$0")")"
__dko_status "Current dir is $CDIR\n"

__dko_status "Symlinking dotfiles"

ln -fns $CDIR/tmux.conf $HOME/.tmux.conf

ln -fns $CDIR/shell $HOME/.config/shell
sed -i '1i source $HOME/.config/shell/zshrc.sh' $HOME/.zshrc

ln -fns $CDIR/nvim $HOME/.config/nvim

exit 0;
