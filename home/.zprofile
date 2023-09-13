if [[ -x "/opt/homebrew/bin/brew" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export GOENV_GOPATH_PREFIX="$HOME/.go"
eval "$(goenv init -)"

eval "$(nodenv init -)"
