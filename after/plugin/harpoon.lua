local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", function()
    mark.add_file()
    print("Added to harpoon.")
end)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-left>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-down>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-up>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-right>", function() ui.nav_file(4) end)

vim.api.nvim_create_autocmd({ "Filetype" }, {
  pattern = "harpoon",
  callback = function()
    vim.opt.cursorline = true
    vim.api.nvim_set_hl(0, 'HarpoonWindow', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'HarpoonBorder', { link = 'Normal' })
  end
})
