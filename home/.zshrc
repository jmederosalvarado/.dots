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

# Directory navigation enhancements:
setopt auto_cd         # Allows you to change directories by typing the directory name directly (without needing to type 'cd').
setopt auto_pushd     # Automatically pushes the new directory onto the directory stack when you change directories.
# setopt pushd_ignore_dups  # (Commented out) Would prevent duplicate entries in the directory stack if enabled.
setopt pushdminus     # Interprets numeric arguments to pushd relative to the right end of the directory stack,
                      # making it easier to reference directories at the end. This behavior differs from the default,
                      # which counts from the left.

# Other useful options:
setopt interactivecomments  # Allows you to include comments (using '#') in your interactive shell input.
setopt multios              # Enables the use of multiple redirections in a single command (e.g., directing output to several files).


# }}}

# HISTORY {{{

HISTSIZE=50000
SAVEHIST=10000

setopt share_history     # share command history data
setopt extended_history  # record timestamp of command in HISTFILE
setopt hist_verify       # show command with history expansion to user before running it

# Show history timestamps
alias history='history -f' # timestamps follow mm/dd/yyyy
# alias history='history -E' # timestamps follow dd.mm.yyyy
# alias history='history -i' # timestamps follow yyyy-mm-dd

# }}}

# COMPLETIONS {{{

# Set up Homebrew completions (if using Homebrew)
fpath=($HOMEBREW_PREFIX/share/{zsh/site-functions,zsh-completions} $fpath)

# Initialize the completion system and (optionally) bash completions
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

# Configure completion options
unsetopt menu_complete      # Do not preselect the first entry
setopt auto_menu            # Activate menu selection on successive TAB presses
setopt complete_in_word     # Allow in-word completion
# setopt always_to_end        # Append completions at the end of the line

# Set the list of completer functions:
#   _complete      - Performs the standard completion.
#   _match         - Enables pattern matching against completion candidates.
#   _approximate   - Allows for fuzzy (approximate) matching to correct minor typos.
zstyle ":completion:*" completer _complete _match _approximate

# Enable an interactive menu selection for completions:
# This makes zsh display a selectable menu when multiple candidates are available,
# letting you navigate through them (e.g., with arrow keys).
zstyle ':completion:*:*:*:*:*' menu select

# Define flexible matcher rules for completion:
#   'm:{a-zA-Z-_}={A-Za-z_-}': Makes matching case-insensitive and treats hyphens/underscores equivalently.
#   'r:|=*'                  : Allows matching when the pattern occurs anywhere within the candidate.
#   'l:|=* r:|=*'            : Further relaxes matching to support partial and fuzzy matches.
zstyle ':completion:*' matcher-list \
       'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

# Set the order for 'cd' command completions:
# When enabled, this would prioritize:
#   1. Local directories (directories in the current working directory),
#   2. Directories from the directory stack,
#   3. Directories specified in the CDPATH.
# zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# }}}


# KEYBINDINGS {{{

autoload -U up-line-or-beginning-search &&
	zle -N up-line-or-beginning-search
autoload -U down-line-or-beginning-search &&
	zle -N down-line-or-beginning-search

# keybindings are defined using zvm_bindkey to prevent
# conflicts with zsh-vi-mode plugin keybindings
function zvm_after_init {
	# [Shift-Tab] - move through the completion menu backwards
	zvm_bindkey viins "$terminfo[kcbt]" reverse-menu-complete

	zvm_bindkey viins '^P' up-line-or-beginning-search
	zvm_bindkey viins '^N' down-line-or-beginning-search
}

function zvm_after_lazy_keybindings {
	# [Shift-Tab] - move through the completion menu backwards
	zvm_bindkey vicmd "$terminfo[kcbt]" reverse-menu-complete

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

alias ls='ls --color'
alias l='ls -lah'
alias ll='ls -lh'

# }}}

# PROMPT {{{

source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
# source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

eval "$(starship init zsh)"

# }}}
