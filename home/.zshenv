export EDITOR="nvim" VISUAL="nvim"

# Setup Rust
path=("$HOME/.cargo/bin" $path)

# Setup .Net
export DOTNET_ROOT="/usr/local/dotnet"
path=($DOTNET_ROOT $path)

# Setup Go
export GOPATH="$HOME/.go"
path=("/usr/local/go/bin" $path)

# Setup Node
path=("/usr/local/node/bin" $path)

# Setup foundry
path=("$HOME/.foundry/bin" $path)

# Nethermind Data
export NETHERMIND_DATA_DIR="$HOME/.nethdata"
