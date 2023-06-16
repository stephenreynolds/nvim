-- zen-mode: Distraction free writing.
return {
    "folke/zen-mode.nvim",
    keys = {
        {
            "<leader>z",
            function()
                local zen = require("zen-mode")
                zen.setup {
                    window = {
                        width = 90,
                        options = {}
                    }
                }
                zen.toggle()
                vim.wo.wrap = false
                vim.wo.number = true
                vim.wo.rnu = true
            end,
            desc = "Toggle zen mode"
        }
    }
}
