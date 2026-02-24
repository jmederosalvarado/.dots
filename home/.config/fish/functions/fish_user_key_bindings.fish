function fish_user_key_bindings
    # Hybrid vi/emacs: emacs Ctrl-key shortcuts available in insert mode,
    # vi normal/visual modes via Escape
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert

    # Ctrl-P/N for prefix history search in insert mode
    bind -M insert \cp history-prefix-search-backward
    bind -M insert \cn history-prefix-search-forward

    # Shift-Tab to cycle completions backward
    bind -M insert \e\[Z complete-and-search

    # j/k for prefix history search in normal mode
    bind -M default k history-prefix-search-backward
    bind -M default j history-prefix-search-forward
end
