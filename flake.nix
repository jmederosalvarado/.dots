{
  description = "Nix dotfiles";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";

    # zsh {{{

    zsh-autosuggestions = {
      url = "github:zsh-users/zsh-autosuggestions";
      flake = false;
    };

    zsh-completions = {
      url = "github:zsh-users/zsh-completions";
      flake = false;
    };

    zsh-fast-syntax-highlighting = {
      url = "github:zdharma-continuum/fast-syntax-highlighting";
      flake = false;
    };

    zsh-vi-mode = {
      url = "github:jeffreytse/zsh-vi-mode";
      flake = false;
    };

    # }}}

  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        packages.shell = pkgs.writeTextFile {
          name = "zsh-config";
          destination = "/share/nix.zsh";
          text = ''
            # Prompt
            starship() {
                "${pkgs.starship}/bin/starship" $@
            }

            # Plugins
            zsh_autosuggestions="${inputs.zsh-autosuggestions}"
            zsh_completions="${inputs.zsh-completions}"
            zsh_fast_syntax_highlighting="${inputs.zsh-fast-syntax-highlighting}"
            zsh_vi_mode="${inputs.zsh-vi-mode}"
          '';
        };
      });
}
