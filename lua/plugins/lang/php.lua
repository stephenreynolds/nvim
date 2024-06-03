return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "php", "php_only" })
      end
    end,
  },

  {
    "williamboman/mason.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "phpactor", "pint" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = {},
      },
    },
  },

  -- {
  --   "stevearc/conform.nvim",
  --   enable = false,
  --   optional = true,
  --   opts = {
  --     formatters_by_ft = {
  --       php = { "pint" },
  --     },
  --   },
  -- },

  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        optional = true,
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "php-debug-adapter" })
        end,
      },
    },
    opts = function()
      local dap = require("dap")
      if not dap.adapters["php"] then
        dap.adapters["php"] = {
          type = "executable",
          command = "node",
          args = {
            require("mason-registry").get_package("php-debug-adapter"):get_install_path() .. "/extension/out/phpDebug.js",
          },
        }
      end
      if not dap.configurations["php"] then
        dap.configurations["php"] = {
          {
            type = "php",
            request = "launch",
            name = "Listen for Xdebug",
            port = 9003,
          },
        }
      end
    end,
  },
}
