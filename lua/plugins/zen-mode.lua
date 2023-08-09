return {
    "folke/zen-mode.nvim",
    opts = {
    },
    keys = {
        {
            "<leader>zz",
            function()
                require("zen-mode").toggle({ window = { width = 0.55 } })
            end,
            desc = "Toggle zen mode"
        }
    }
}
