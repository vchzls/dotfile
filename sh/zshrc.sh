# setopt
setopt interactive_comments hist_ignore_dups  octal_zeroes   no_prompt_cr
setopt no_hist_no_functions no_always_to_end  append_history list_packed
setopt inc_append_history   complete_in_word  no_auto_menu   auto_pushd
setopt pushd_ignore_dups    no_glob_complete  no_glob_dots   c_bases
setopt numeric_glob_sort    no_share_history  promptsubst    auto_cd
setopt rc_quotes            extendedglob      notify

ZINIT="$HOME/.zinit/bin/zinit.zsh"

# Install zinit.zsh if not exist
if [ ! -f "$ZINIT" ]; then
	echo "Installing zinit ..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi

source ~/.zinit/bin/zinit.zsh

# Fast-syntax-highlighting & autosuggestions
zinit wait lucid for \
	atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" \
	zdharma/fast-syntax-highlighting \
	atload"!_zsh_autosuggest_start" \
	zsh-users/zsh-autosuggestions \
	blockf \
	zsh-users/zsh-completions \
	zdharma/history-search-multi-word

# lib/git.zsh is loaded mostly to stay in touch with the plugin (for the users)
# and for the themes 2 & 3 (lambda-mod-zsh-theme & lambda-gitster)
zinit wait lucid for \
	zdharma/zsh-unique-id \
	OMZ::lib/git.zsh \
	atload"unalias grv g" \
	OMZ::plugins/git/git.plugin.zsh

# Theme: lambda
zinit lucid load'![[ $MYPROMPT = lambda ]]' unload'![[ $MYPROMPT != lambda ]]' nocd for \
	halfo/lambda-mod-zsh-theme

# Theme: pure
zinit lucid load'![[ $MYPROMPT = pure ]]' unload'![[ $MYPROMPT != pure ]]' \
	pick"/dev/null" multisrc"{async,pure}.zsh" atload'!prompt_pure_precmd' nocd for \
	sindresorhus/pure

 # Theme: powerlevel10k
 zinit lucid load'![[ $MYPROMPT = p10k ]]' unload'![[ $MYPROMPT != p10k ]]' nocd for \
     romkatv/powerlevel10k
# 
MYPROMPT=p10k

if [[ $MYPROMPT = p10k ]]; then
    source ~/.config/sh/p10k.zsh
fi

source ~/.config/sh/python.sh
source ~/.config/sh/aliases.sh
