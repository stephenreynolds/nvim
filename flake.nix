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
