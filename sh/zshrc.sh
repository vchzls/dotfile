# setopt
# history
setopt hist_expire_dups_first   # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups         # ignore duplicated commands history list
setopt hist_ignore_space        # ignore commands that start with space
setopt share_history            # share command history data
# setopt inc_append_history       # append command to history file immediately after execution
setopt hist_find_no_dups        # 
setopt interactive_comments octal_zeroes   no_prompt_cr
setopt no_hist_no_functions no_always_to_end  no_auto_menu append_history list_packed
setopt complete_in_word  auto_pushd
setopt pushd_ignore_dups    no_glob_complete  no_glob_dots   c_bases
setopt numeric_glob_sort  promptsubst    auto_cd
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

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

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
 zinit lucid load'![[ $MYPROMPT = p10k ]]' unload'![[ $MYPROMPT != p10k ]]' depth=1 nocd for \
     romkatv/powerlevel10k
# 
MYPROMPT=p10k

if [[ $MYPROMPT = p10k ]]; then
    source ~/.config/sh/p10k.zsh
fi

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 5000 ] && HISTSIZE=5000
[ "$SAVEHIST" -lt 5000 ] && SAVEHIST=5000

source ~/.config/sh/python.sh
source ~/.config/sh/aliases.sh
export DISPLAY=$(grep nameserver /etc/resolv.conf | awk '{print $2}'):0.0
export LIBGL_ALWAYS_INDIRECT=1
export GDK_SCALE=0.5
export GDK_DPI_SCALING=1.5
export DISPLAY=localhost:0.0

function cgit() {
    git_url="https://github.com"
    cnpmjs_url="https://github.com.cnpmjs.org"
    fastgit_url="https://hub.fastgit.org"
    clone_url="https://gitclone.com/github.com"
    args=( "$@" )
    for ((i=0; i <= $#; i++)) ;do
      if [[ ${args[$i]} == *"${git_url}"* ]]; then
           args[$i]=${args[$i]/$git_url/$clone_url}
      fi
    done
    echo ${args}
    git ${args}
}
