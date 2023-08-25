return {
    "folke/zen-mode.nvim",
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
