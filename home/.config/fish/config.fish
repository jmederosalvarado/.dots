# Homebrew
/opt/homebrew/bin/brew shellenv | source

# mise (no interactive guard — scripts need mise-managed tools on PATH too)
mise activate fish | source

if not status is-interactive
    return
end

# Abbreviations (expand inline so you see the real command)
abbr -a l ls -lAh
abbr -a ll ls -lh


starship init fish | source
