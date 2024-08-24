self:
{ pkgs, ... }:

let system = pkgs.stdenv.hostPlatform.system;
in {
  config = {
    programs.neovim = {
      withNodeJs = true;
      extraPackages = self.runtimeDependencies.${system};
      extraLuaPackages = ps: [ ps.magick ps.tiktoken_core ];
    };

    home.sessionVariables = { NVIM_SQLITE_PATH = pkgs.sqlite.out; };

    xdg.configFile.nvim.source = ../.;

    xdg.desktopEntries = {
      nvim = {
        name = "Neovim";
        genericName = "Text Editor";
        comment = "Edit text files";
        exec = "nvim %F";
        icon = "nvim";
        mimeType = [
          "text/english"
          "text/plain"
          "text/x-makefile"
          "text/x-c++hdr"
          "text/x-c++src"
          "text/x-chdr"
          "text/x-csrc"
          "text/x-java"
          "text/x-moc"
          "text/x-pascal"
          "text/x-tcl"
          "text/x-tex"
          "application/x-shellscript"
          "text/x-c"
          "text/x-c++"
        ];
        terminal = true;
        type = "Application";
        categories = [ "Utility" "TextEditor" ];
      };
    };

    programs.git.ignores = [ ".avante_chat_history" ];
  };
}
