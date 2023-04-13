# Makefile to install dependecies

zsh_completions = $(HOME)/.zsh/zsh-completions
zsh_autosuggestions = $(HOME)/.zsh/zsh-autosuggestions
zsh_vi_mode = $(HOME)/.zsh/zsh-vi-mode
zsh_syntax = $(HOME)/.zsh/fast-syntax-highlighting
tmux_tpm = $(HOME)/.tmux/plugins/tpm

default:
	@echo 'make [ zsh | tmux ]'

.PHONY: zsh
zsh: $(zsh_completions) $(zsh_autosuggestions) $(zsh_vi_mode) $(zsh_syntax)
	stow zsh
	@echo Install starship using package manager

$(zsh_completions):
	git clone --depth 1 https://github.com/zsh-users/zsh-completions $@
	
$(zsh_autosuggestions):
	git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions $@

$(zsh_vi_mode):
	git clone --depth 1 https://github.com/jeffreytse/zsh-vi-mode $@

$(zsh_syntax):
	git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting $@

.PHONY: tmux
tmux: $(tmux_tpm)
	stow tmux

$(tmux_tpm):
	git clone --depth 1 https://github.com/tmux-plugins/tpm $@
