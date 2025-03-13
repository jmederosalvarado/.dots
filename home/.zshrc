if type brew &>/dev/null; then
	HOMEBREW_PREFIX="$(brew --prefix)"
else
	echo 1>&2 "Homebrew not installed!"
	echo 1>&2 "    https://brew.sh"
	exit 1
fi

# Remove duplicates from PATH
typeset -U path

# OPTIONS {{{

# Changing directories
setopt auto_cd
setopt auto_pushd
# setopt pushd_ignore_dups
setopt pushdminus

setopt interactivecomments # Recognize comments
setopt multios             # Allow multiple redirection streams

# }}}

# HISTORY {{{

HISTSIZE=50000
SAVEHIST=10000

setopt share_history          # share command history data
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_verify            # show command with history expansion to user before running it
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE

# Show history timestamps
alias history='history -f' # timestamps follow mm/dd/yyyy
# alias history='history -E' # timestamps follow dd.mm.yyyy
# alias history='history -i' # timestamps follow yyyy-mm-dd

# }}}

# COMPLETIONS {{{

# Setup fpath
fpath=("$HOME/.local/share/zsh/site-functions" "$HOMEBREW_PREFIX/share/zsh/site-functions" "$HOMEBREW_PREFIX/share/zsh-completions" $fpath)


source "$HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

bindkey              '^I' menu-select
bindkey "$terminfo[kcbt]" menu-select

bindkey -M menuselect              '^I'         menu-complete
bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete

# KEYBINDINGS {{{

autoload -U up-line-or-beginning-search &&
	zle -N up-line-or-beginning-search
autoload -U down-line-or-beginning-search &&
	zle -N down-line-or-beginning-search

# keybindings are defined using zvm_bindkey to prevent
# conflicts with zsh-vi-mode plugin keybindings
function zvm_after_init {
	# # [Home] - Go to beginning of line
	# zvm_bindkey viins "$terminfo[khome]" beginning-of-line
	# # [End] - Go to end of line
	# zvm_bindkey viins "$terminfo[kend]" end-of-line

	# [Shift-Tab] - move through the completion menu backwards
	zvm_bindkey viins "$terminfo[kcbt]" reverse-menu-complete

	# # [Delete] - delete forward
	# zvm_bindkey viins "^[[3~" delete-char

	# # [Ctrl-Delete] - delete whole forward-word
	# zvm_bindkey viins '^[[3;5~' kill-word

	# # [Ctrl-RightArrow] - move forward one word
	# zvm_bindkey viins '^[[1;5C' forward-word
	# # [Ctrl-LeftArrow] - move backward one word
	# zvm_bindkey viins '^[[1;5D' backward-word

	# # [UpArrow] - Search history backwards
	# zvm_bindkey viins "$terminfo[kcuu1]" up-line-or-beginning-search
	# # [DownArrow] - Search history forward
	# zvm_bindkey viins "$terminfo[kcud1]" down-line-or-beginning-search

	zvm_bindkey viins '^P' up-line-or-beginning-search
	zvm_bindkey viins '^N' down-line-or-beginning-search
}

function zvm_after_lazy_keybindings {
	# # [Home] - Go to beginning of line
	# zvm_bindkey vicmd "$terminfo[khome]" beginning-of-line
	# # [End] - Go to end of line
	# zvm_bindkey vicmd "$terminfo[kend]" end-of-line

	# [Shift-Tab] - move through the completion menu backwards
	zvm_bindkey vicmd "$terminfo[kcbt]" reverse-menu-complete

	# # [Delete] - delete forward
	# zvm_bindkey vicmd "^[[3~" delete-char

	# # [Ctrl-Delete] - delete whole forward-word
	# zvm_bindkey vicmd '^[[3;5~' kill-word

	# # [Ctrl-RightArrow] - move forward one word
	# zvm_bindkey vicmd '^[[1;5C' forward-word
	# # [Ctrl-LeftArrow] - move backward one word
	# zvm_bindkey vicmd '^[[1;5D' backward-word

	# # [UpArrow] - Search history backwards
	# zvm_bindkey vicmd "$terminfo[kcuu1]" up-line-or-beginning-search
	# # [DownArrow] - Search history forward
	# zvm_bindkey vicmd "$terminfo[kcud1]" down-line-or-beginning-search

	zvm_bindkey viins '^P' up-line-or-beginning-search
	zvm_bindkey viins '^N' down-line-or-beginning-search
	zvm_bindkey vicmd 'k' up-line-or-beginning-search
	zvm_bindkey vicmd 'j' down-line-or-beginning-search
}

source "$HOMEBREW_PREFIX/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

# }}}

# ALIASES & HELPERS {{{

take() {
	mkdir -p $1 && cd $1
}

load_key_anthropic () {
    export ANTHROPIC_API_KEY=$(op read "op://Personal/Anthropic API Key/credential")
}

alias ls='ls --color'
alias l='ls -lah'
alias ll='ls -lh'

# }}}

# TOOLS {{{


# }}}

export DYLD_FALLBACK_LIBRARY_PATH="$HOMEBREW_PREFIX/lib"

# PROMPT {{{

source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
# source "$HOMEBREW_PREFIX/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

eval "$(starship init zsh)"

# }}}

# opam configuration
[[ ! -r /Users/jmederos/.opam/opam-init/init.zsh ]] || source /Users/jmederos/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "/Users/jmederos/.bun/_bun"
