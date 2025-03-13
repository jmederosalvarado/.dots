if [[ -x "/opt/homebrew/bin/brew" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export EDITOR="nvim" VISUAL="nvim"

# Setup Rust
path=("$HOME/.cargo/bin" $path)

# Setup .Net
export DOTNET_ROOT="/usr/local/dotnet"
path=($DOTNET_ROOT $path)

# Setup Go
export GOROOT="/usr/local/go123"
# export GOROOT="/usr/local/go121"
# export GOROOT="/usr/local/go120"
export GOPATH="$HOME/.go"
path=("$GOROOT/bin" "$GOPATH/bin" $path)

# Only setup Zig if not running inside VSCode or Cursor.ai integrated terminal
if [[ -z $VSCODE_INJECTION && -z $CURSOR_INJECTION ]]; then
    path=("/usr/local/zig-macos-aarch64-0.14.0-dev.1860+2e2927735" $path)
fi

# Setup Node
path=("/usr/local/node16/bin" $path)

# Setup Bun
path=("$HOME/.bun/bin" $path)

# Setup foundry
path=("$HOME/.foundry/bin" $path)

source "$HOME/.secrets.sh"
