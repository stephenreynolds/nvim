return {
    ["nil"] = {
        formatting = {
            command = { "nixpkgs-fmt" },
        },
        nix = {
            flake = {
                autoArchive = true,
            },
        },
    },
}
