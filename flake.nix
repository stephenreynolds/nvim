{
  description = "My Neovim config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      genSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" ];

      pkgs = genSystems (system: import nixpkgs { inherit system; });

      runtimeDependencies = genSystems (system: with pkgs.${system}; [
        black
        cargo
        clang-tools
        codespell
        delve
        emmet-ls
        fzf
        gcc
        gnumake
        go
        haskell-language-server
        isort
        jq
        lldb
        lua-language-server
        luarocks
        marksman
        nil
        nixpkgs-fmt
        nixpkgs-fmt
        nodePackages.bash-language-server
        nodePackages.typescript-language-server
        ocamlPackages.ocaml-lsp
        ocamlformat
        prettierd
        pyright
        ripgrep
        rust-analyzer
        rustfmt
        shellcheck
        stylua
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

      devShells = genSystems (system: with pkgs.${system}; {
        default = mkShell {
          buildInputs = [
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
