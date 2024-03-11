return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    settings = {
      sync_on_ui_close = true,
    },
  },
  config = function(_, opts)
    local harpoon = require('harpoon')
    harpoon:setup(opts)

    -- Keymaps for opening files in splits or tabs
    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set('n', '<C-v>', function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set('n', '<C-x>', function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set('n', '<C-t>', function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })
      end,
    })

    -- Highlight cursor line
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
        harpoon.ui:toggle_quick_menu(harpoon:list(), {
          border = 'rounded',
          title_pos = 'center',
          ui_width_ratio = 0.4,
        })
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
