return {
    "folke/which-key.nvim",
    config = function()
        local wk = require("which-key")

        wk.register({
            g = "Git",
            i = "AI",
            l = {
                name = "LSP",
                w = "Workspace",
            },
            n = "Notifications",
            r = "Refactor",
            s = "Search",
            ["["] = "Previous",
			["]"] = "Next",
        }, { prefix = "<leader>" })
    end,
    keys = {
        { "<leader>" }
    }
}
