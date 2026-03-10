if [[ -x "/opt/homebrew/bin/brew" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

eval "$(mise activate zsh --shims)"

export EDITOR="nvim" VISUAL="nvim"

path=("$HOME/.local/bin" $path)
