# Makefile to install dependecies

packer_path = $(HOME)/.local/share/nvim/site/pack/packer/start/packer.nvim
zinit_path = $(HOME)/.local/share/zinit/zinit.git

default:
	@echo 'make [ packer | zinit ]'

.PHONY: packer
packer: $(packer_path)

$(packer_path):
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $@

.PHONY: zinit
zinit: $(zinit_path)

$(zinit_path):
	git clone --depth 1 https://github.com/zdharma-continuum/zinit $@
