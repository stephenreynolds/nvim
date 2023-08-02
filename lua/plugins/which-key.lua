return {
    "folke/which-key.nvim",
    config = function()
        local wk = require("which-key")

        wk.register({
            n = "Notifications",
            r = "Refactor",
            s = "Search",
        }, { prefix = "<leader>" })
    end,
    keys = {
        { "<leader>" }
    }
}
