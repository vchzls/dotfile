#!/bin/bash
chsh -s $(which zsh)

CDIR="$(dirname "$(readlink -f "$0")")"
printf "Current dir is $CDIR\n"

printf "\033[33mChecking Start...\033[0m\n"

printf "\033[36mChecking Git install...\033[0m\n"
hash git 2>/dev/null || { echo >&2 "Require Git is not installed! Please install Git before you prefix config aix"; exit 1; }
git --version
printf "\033[36mChecking Git Completed!\033[0m\n"

if [ ! -f "$HOME/.tmux.conf" ]; then
	printf "\033[36mCopy tmux.conf!\033[0m\n"
	cp -f .tmux.conf $HOME/
else
	printf "\033[36mExisting tmux.conf!\033[0m\n"
	printf "\033[36mMove tmux.conf to tmux.conf.backup!\033[0m\n"
    mv $HOME/.tmux.conf $HOME/.tmux.conf.backup
	cp -f .tmux.conf $HOME/
fi

if [ ! -f "$HOME/.zshrc" ]; then
	printf "\033[36mCreate new zshrc!\033[0m\n"
	cp -f sh/zshrc.sh $HOME/.zshrc
else
	printf "\033[36mExisting zshrc!\033[0m\n"
	printf "\033[36mMove zshrc to zshrc.backup!\033[0m\n"
    mv $HOME/.zshrc $HOME/.zshrc.backup
	cp -f sh/zshrc.sh $HOME/.zshrc
fi

if [ ! -d "$HOME/.config/sh" ]; then
	printf "\033[36mCreate .config/sh !\033[0m\n"
	mkdir -p $HOME/.config/sh
fi

cp -r sh/aliases.sh $HOME/.config/sh
cp -r sh/python.sh $HOME/.config/sh
cp -r sh/p10k.zsh $HOME/.config/sh


if [ ! -d "$HOME/.config/nvim" ]; then
	printf "\033[36mCreate .config/nvim !\033[0m\n"
else
	printf "\032[36mExisting .config/nvim !\033[0m\n"
	printf "\033[36mMove .config/nvim to .config/nvim.backup!\033[0m\n"
	mv $HOME/.config/nvim $HOME/.config/nvim.backup
	cp -r nvim $HOME/.config
fi

exit 0;
