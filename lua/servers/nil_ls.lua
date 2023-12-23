return {
  ["nil"] = {
    formatting = {
      command = { "alejandra" },
    },
    nix = {
      flake = {
        autoArchive = true,
      },
    },
  },
}
