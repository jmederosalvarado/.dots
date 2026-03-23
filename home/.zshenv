typeset -U path PATH

if [[ -x "/opt/homebrew/bin/brew" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

eval "$(mise activate zsh --shims)"

path=("$HOME/.local/bin" $path)
fpath=("$HOME/.local/share/dots/site-functions/" $fpath)

export EDITOR="nvim" VISUAL="nvim"
