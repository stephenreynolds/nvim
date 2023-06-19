-- zen-mode: Distraction free writing.
return {
    "folke/zen-mode.nvim",
    opts = {
        window = {
            width = 126,
        },
    },
    keys = {
        {
            "<leader>z",
            function()
                local zen = require("zen-mode")
                zen.toggle()
                vim.wo.wrap = false
                vim.wo.number = true
                vim.wo.rnu = true
            end,
            desc = "Toggle zen mode"
        }
    }
}
