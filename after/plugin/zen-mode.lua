local zen = require("zen-mode")
vim.keymap.set("n", "<leader>z", function()
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
end, { desc = "Toggle Zen Mode" })
