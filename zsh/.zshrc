has_brew () {
    if [ -f "/opt/homebrew/bin/brew" ]; then
        return 0
    else
        return 1
    fi
}

if has_brew; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
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

# Setup fpath
fpath=("$HOME/.zsh/zsh-completions/src" $fpath)
if has_brew; then
    fpath=("$(brew --prefix)/share/zsh-completions/src" $fpath)
fi

# Load all stock functions (from $fpath files)
autoload -U compinit && compinit -d "$HOME/.zcompdump"

# Automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

# FIXME - the load process here seems a bit bizarre
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
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path "$HOME/.zcompdump"

# eval $(dircolors -b) && zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"

# }}}

# KEYBINDINGS {{{

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

    # # [Home] - Go to beginning of line
    # zvm_bindkey viins "$terminfo[khome]" beginning-of-line
    # # [End] - Go to end of line
    # zvm_bindkey viins "$terminfo[kend]" end-of-line

    # # [Shift-Tab] - move through the completion menu backwards
    # zvm_bindkey viins "$terminfo[kcbt]" reverse-menu-complete

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

    # # [Shift-Tab] - move through the completion menu backwards
    # zvm_bindkey vicmd "$terminfo[kcbt]" reverse-menu-complete

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

source "$HOME/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

# }}}

# ALIASES & HELPERS {{{

take () {
    mkdir -p $1 && cd $1
}

alias ls='ls --color'
alias l='ls -lah'
alias ll='ls -lh'

# }}}

# PROMPT {{{

source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

eval "$(starship init zsh)"

# }}}

# TOOLS {{{

export EDITOR="nvim" VISUAL="nvim"

export NVM_DIR="$HOME/.nvm"

if has_brew; then
    # use gnu coreutils by default
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

fi

# Setup rust
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
    export PATH="$HOME/.cargo/bin:$PATH"
fi

export PATH="$HOME/.bin/go/bin:$PATH"
# Setup go
if [ -d "$HOME/.go" ]; then
    export PATH="$HOME/.go/bin:$PATH"
fi

# }}}
#
export DYLD_LIBRARY_PATH="/opt/homebrew/lib"

export PATH="$PATH:$HOME/.foundry/bin"
