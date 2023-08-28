if [[ -x "/opt/homebrew/bin/brew" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export EDITOR="nvim" VISUAL="nvim"

# Setup Rust
path=("$HOME/.cargo/bin" $path)

# Setup Go
export GOPATH="$HOME/.go"
path=("$GOPATH/bin" $path)

# Setup .Net
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"
