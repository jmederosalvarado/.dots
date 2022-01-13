# OPTIONS {{{

# Changing directories
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

setopt interactivecomments # Recognize comments
setopt multios             # Allow multiple redirection streams

# }}}

# HISTORY {{{

HISTFILE="$HOME/.zhistory"
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

# NOTE: Apparently compinit is already run by zplug
# Load all stock functions (from $fpath files) called below.
# autoload -U compinit && compinit -d "$HOME/.zcompdump"

# Automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

# fixme - the load process here seems a bit bizarre
zmodload -i zsh/complist

unsetopt menu_complete # do not autoselect the first completion entry
setopt auto_menu       # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

# zstyle pattern
# :completion:<function>:<completer>:<command>:<argument>:<tag>

# define completers
zstyle ":completion:*" completer _complete _match _approximate

zstyle ':completion:*:*:*:*:*' menu select

# case insensitive (all), partial-word and substring completion
# hyphen insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
# hyphen sensitive
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# use caching so that commands like apt and dpkg complete are usable
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.zcompdump"

# }}}

# # KEYBINDINGS {{{

function hook_bindkeys {
	autoload -U up-line-or-beginning-search &&
		zle -N up-line-or-beginning-search
	autoload -U down-line-or-beginning-search &&
		zle -N down-line-or-beginning-search

	# keybindings are defined using zvm_bindkey to prevent
	# conflicts with zsh-vi-mode plugin keybindings
	function zvm_after_init {
		# automatically expand ... to ../..
		function rationalise_dot {
			if [[ $LBUFFER = *.. ]]; then
				LBUFFER+=/..
			else
				LBUFFER+=.
			fi
		}
		zvm_define_widget rationalise_dot
		zvm_bindkey viins "." rationalise_dot

		# [Home] - Go to beginning of line
		zvm_bindkey viins "$terminfo[khome]" beginning-of-line
		# [End] - Go to end of line
		zvm_bindkey viins "$terminfo[kend]" end-of-line

		# [Shift-Tab] - move through the completion menu backwards
		zvm_bindkey viins "$terminfo[kcbt]" reverse-menu-complete

		# [Delete] - delete forward
		zvm_bindkey viins "^[[3~" delete-char

		# [Ctrl-Delete] - delete whole forward-word
		zvm_bindkey viins '^[[3;5~' kill-word

		# [Ctrl-RightArrow] - move forward one word
		zvm_bindkey viins '^[[1;5C' forward-word
		# [Ctrl-LeftArrow] - move backward one word
		zvm_bindkey viins '^[[1;5D' backward-word

		# [UpArrow] - Search history backwards
		zvm_bindkey viins "$terminfo[kcuu1]" up-line-or-beginning-search
		# [DownArrow] - Search history forward
		zvm_bindkey viins "$terminfo[kcud1]" down-line-or-beginning-search

		zvm_bindkey viins '^P' up-line-or-beginning-search
		zvm_bindkey viins '^N' down-line-or-beginning-search
	}

	function zvm_after_lazy_keybindings {
		# [Home] - Go to beginning of line
		zvm_bindkey vicmd "$terminfo[khome]" beginning-of-line
		# [End] - Go to end of line
		zvm_bindkey vicmd "$terminfo[kend]" end-of-line

		# [Shift-Tab] - move through the completion menu backwards
		zvm_bindkey vicmd "$terminfo[kcbt]" reverse-menu-complete

		# [Delete] - delete forward
		zvm_bindkey vicmd "^[[3~" delete-char

		# [Ctrl-Delete] - delete whole forward-word
		zvm_bindkey vicmd '^[[3;5~' kill-word

		# [Ctrl-RightArrow] - move forward one word
		zvm_bindkey vicmd '^[[1;5C' forward-word
		# [Ctrl-LeftArrow] - move backward one word
		zvm_bindkey vicmd '^[[1;5D' backward-word

		# [UpArrow] - Search history backwards
		zvm_bindkey vicmd "$terminfo[kcuu1]" up-line-or-beginning-search
		# [DownArrow] - Search history forward
		zvm_bindkey vicmd "$terminfo[kcud1]" down-line-or-beginning-search

		zvm_bindkey viins '^P' up-line-or-beginning-search
		zvm_bindkey viins '^N' down-line-or-beginning-search
		zvm_bindkey vicmd 'k' up-line-or-beginning-search
		zvm_bindkey vicmd 'j' down-line-or-beginning-search
	}
}

# Environment {{{

if command -v nvim &>/dev/null ; then
  export EDITOR="nvim" VISUAL="nvim"
elif command -v vim &>/dev/null ; then
  export EDITOR="vim" VISUAL="vim"
elif command -v vi &>/dev/null ; then
  export EDITOR="vi" VISUAL="vi"
fi

# }}}

# ALIASES {{{

alias ls='ls --color'
alias l='ls -lah'
alias ll='ls -lh'

# Carefull
alias rm="rmtrash"
alias rmdir="rmdirtrash"

# }}}

# TOOLS {{{

# zsh parameter completion for the dotnet CLI

_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet

export DOTNET_ROOT="$HOME/.bin/dotnet"
export PATH="$DOTNET_ROOT:$PATH"

# Add path to user local tools
export PATH="$HOME/.local/bin:$PATH"

# }}}

# ZINIT {{{

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

zinit ice as"command" from"gh-r" \
	atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
	atpull"%atclone" src"init.zsh"
zinit light starship/starship

zinit ice wait lucid atinit'zicompinit; zicdreplay'
zinit light 'zdharma/fast-syntax-highlighting'

zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light 'zsh-users/zsh-autosuggestions'

zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light 'zsh-users/zsh-completions'

zinit ice atload'hook_bindkeys'
zinit light 'jeffreytse/zsh-vi-mode'

# }}}

eval $(dircolors -b)
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
