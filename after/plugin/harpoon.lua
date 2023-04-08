local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", function()
    mark.add_file()
    print("Added to harpoon.")
end, { desc = "Add to harpoon" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon quick menu" })

vim.keymap.set("n", "<C-left>", function() ui.nav_file(1) end, { desc = "Go to quick file 1" })
vim.keymap.set("n", "<C-down>", function() ui.nav_file(2) end, { desc = "Go to quick file 2" })
vim.keymap.set("n", "<C-up>", function() ui.nav_file(3) end, { desc = "Go to quick file 3" })
vim.keymap.set("n", "<C-right>", function() ui.nav_file(4) end, { desc = "Go to quick file 4" })

vim.api.nvim_create_autocmd({ "Filetype" }, {
  pattern = "harpoon",
  callback = function()
    vim.opt.cursorline = true
    vim.api.nvim_set_hl(0, 'HarpoonWindow', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'HarpoonBorder', { link = 'Normal' })
  end
})
