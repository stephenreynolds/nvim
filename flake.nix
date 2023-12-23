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
        gcc
        clang-tools
        gnumake
        fzf
        unzip
        wget
        go
        delve
        cargo
        luarocks
        tree-sitter
        nil
        nixpkgs-fmt
        lua-language-server
        stylua
        vscode-langservers-extracted
        nodePackages.typescript-language-server
        nodePackages.bash-language-server
        haskell-language-server
        prettierd
        isort
        black
        emmet-ls
        pyright
        marksman
        ocamlPackages.ocaml-lsp
        ocamlformat
        nixpkgs-fmt
        rustfmt
        rust-analyzer
        shellcheck
        yamlfmt
        jq
        codespell
        lldb
      ]);
    in
    {
      inherit runtimeDependencies;

      homeManagerModules.default = import ./nix/hm-module.nix self;

      devShells = genSystems (system: {
        default = pkgs.${system}.mkShell {
          buildInputs = runtimeDependencies.${system};
        };
      });
    };
}
