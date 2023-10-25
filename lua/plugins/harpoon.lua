return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    vim.api.nvim_create_autocmd({ "Filetype" }, {
      pattern = "harpoon",
      callback = function()
        vim.opt.cursorline = true
        vim.api.nvim_set_hl(0, "HarpoonWindow", { link = "Normal" })
        vim.api.nvim_set_hl(0, "HarpoonBorder", { link = "Normal" })
      end,
    })
  end,
  keys = {
    {
      "<leader>a",
      function()
        require("harpoon.mark").add_file()
        print("Added to harpoon.")
      end,
      desc = "Add to harpoon",
    },
    {
      "<C-e>",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Harpoon quick menu",
    },
    {
      "<C-left>",
      function()
        require("harpoon.ui").nav_file(1)
      end,
      desc = "Go to quick file 1",
    },
    {
      "<C-down>",
      function()
        require("harpoon.ui").nav_file(2)
      end,
      desc = "Go to quick file 2",
    },
    {
      "<C-up>",
      function()
        require("harpoon.ui").nav_file(3)
      end,
      desc = "Go to quick file 3",
    },
    {
      "<C-right>",
      function()
        require("harpoon.ui").nav_file(4)
      end,
      desc = "Go to quick file 4",
    },
  },
}
