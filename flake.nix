{
  description = "My Neovim config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      genSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" ];

      pkgs = genSystems (system: import nixpkgs { inherit system; });

      runtimeDependencies = genSystems (system:
        with pkgs.${system}; [
          ansible-language-server
          black
          cargo
          clang-tools
          codespell
          delve
          docker-compose-language-service
          dockerfile-language-server-nodejs
          emmet-language-server
          fswatch
          fzf
          gcc
          gnumake
          go
          gofumpt
          gopls
          gotools
          imagemagick
          isort
          jq
          lldb
          lua-language-server
          luajit
          luajitPackages.magick
          luajitPackages.tiktoken_core
          luarocks
          markdownlint-cli
          marksman
          nil
          nixd
          nixpkgs-fmt
          nodejs
          nodePackages.bash-language-server
          nodePackages.typescript-language-server
          openssl
          phpactor
          php84
          php84Packages.composer
          php84Packages.php-cs-fixer
          php84Extensions.xdebug
          pkg-config
          prettierd
          pyright
          ripgrep
          rust-analyzer
          rustfmt
          shellcheck
          shfmt
          stylua
          tailwindcss-language-server
          taplo
          tree-sitter
          unzip
          vscode-langservers-extracted
          wget
          yaml-language-server
          yamlfmt
        ]);
    in
    {
      inherit runtimeDependencies;

      homeManagerModules.default = import ./nix/hm-module.nix self;

      devShells = genSystems (system:
        with pkgs.${system}; {
          default = mkShell {
            buildInputs = [
              neovim
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
