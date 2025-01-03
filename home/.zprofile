if [[ -x "/opt/homebrew/bin/brew" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# From 1Password
# export ANTHROPIC_API_KEY=$(op read "op://Personal/Anthropic API Key/credential")
