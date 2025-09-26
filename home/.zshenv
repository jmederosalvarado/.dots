if [[ -x "/opt/homebrew/bin/brew" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export EDITOR="nvim" VISUAL="nvim"

export DYLD_FALLBACK_LIBRARY_PATH="$HOMEBREW_PREFIX/lib"

# Rust
path=("/opt/homebrew/opt/rustup/bin" $path)

# Node
path=("/opt/homebrew/opt/node@20/bin" $path)

path=("$HOME/.local/bin" $path)

export PATH="/Users/jmederos/.local/share/solana/install/active_release/bin:$PATH"
