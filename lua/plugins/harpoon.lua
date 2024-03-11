return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    vim.api.nvim_create_autocmd({ 'Filetype' }, {
      pattern = 'harpoon',
      callback = function()
        vim.opt.cursorline = true
        vim.api.nvim_set_hl(0, 'HarpoonWindow', { link = 'Normal' })
        vim.api.nvim_set_hl(0, 'HarpoonBorder', { link = 'Normal' })
      end,
    })
  end,
  keys = {
    {
      '<leader>a',
      function()
        require('harpoon'):list():append()
        print('Added to harpoon.')
      end,
      desc = 'Add to harpoon',
    },
    {
      '<C-e>',
      function()
        local harpoon = require('harpoon')
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = 'Harpoon quick menu',
    },
    {
      '<C-left>',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = 'Go to quick file 1',
    },
    {
      '<C-down>',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = 'Go to quick file 2',
    },
    {
      '<C-up>',
      function()
        require('harpoon'):list():select(3)
      end,
      desc = 'Go to quick file 3',
    },
    {
      '<C-right>',
      function()
        require('harpoon'):list():select(4)
      end,
      desc = 'Go to quick file 4',
    },
  },
}
