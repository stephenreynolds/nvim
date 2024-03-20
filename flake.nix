{
  description = "My Neovim config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    neovim = {
      url = "github:neovim/neovim/nightly?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      genSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" ];

      pkgs = genSystems (system: import nixpkgs { inherit system; });

      runtimeDependencies = genSystems (system:
        with pkgs.${system}; [
          black
          cargo
          clang-tools
          codespell
          delve
          docker-compose-language-service
          dockerfile-language-server-nodejs
          emmet-ls
          fswatch
          fzf
          gcc
          gnumake
          go
          gofumpt
          gotools
          isort
          jq
          lldb
          luajit
          lua-language-server
          luarocks
          markdownlint-cli
          marksman
          # nil
          nixd
          nixfmt
          nodePackages.bash-language-server
          nodePackages.typescript-language-server
          prettierd
          pyright
          ripgrep
          rust-analyzer
          rustfmt
          shellcheck
          shfmt
          stylua
          tree-sitter
          unzip
          vscode-langservers-extracted
          wget
          yaml-language-server
          yamlfmt
        ]);
    in {
      inherit runtimeDependencies;

      homeManagerModules.default = import ./nix/hm-module.nix self;

      devShells = genSystems (system:
        with pkgs.${system}; {
          default = mkShell {
            buildInputs = [
              inputs.neovim.defaultPackage.${system}
              nodejs
              (writeShellScriptBin "nvim-dev" ''
                NVIM_APPNAME=nvim-dev nvim $@
              '')
            ] ++ runtimeDependencies.${system};
            shellHook = ''
              ln -sfT $(git rev-parse --show-toplevel) "$XDG_CONFIG_HOME"/nvim-dev
            '';
          };
        });
    };
}
