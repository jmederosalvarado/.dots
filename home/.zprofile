if [[ -x "/opt/homebrew/bin/brew" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export EDITOR="nvim" VISUAL="nvim"

export DYLD_FALLBACK_LIBRARY_PATH="$HOMEBREW_PREFIX/lib"

path=("$HOME/.local/bin" $path)
