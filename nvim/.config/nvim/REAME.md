# My neovim configuration

This is my very simple neovim configuration, I mostly have a terminal based workflow, but sometimes I use vscode with neovim plugin.

## Instructions

1. Install neovim nightly
    - [Nightly release page](https://github.com/neovim/neovim/releases/nightly)
    - [Wiki page](https://github.com/neovim/neovim/wiki/Installing-Neovim)

2. Install [packer](https://github.com/wbthomason/packer.nvim)

    ```sh
    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    ```

3. Open `nvim` and run `PackerSync`