return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.filetype.add({ pattern = { [".*%.blade%.php"] = "blade" } })

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }

      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "php", "php_only", "blade", "html", "css", "javascript" })
      end
    end,
  },

  {
    "williamboman/mason.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "phpactor", "php-cs-fixer" })
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

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = { "php-cs-fixer" },
      },
      formatters = {
        ["php-cs-fixer"] = {
          command = "php-cs-fixer",
          args = function(_, ctx)
            local args = { "fix", "$FILENAME", "--quiet", "--no-interaction", "--using-cache=no" }
            local found = vim.fs.find(".php-cs-fixer.dist.php", { upward = true, path = ctx.dirname })[1]
            if found then
              vim.list_extend(args, { "--config=" .. found })
            else
              vim.list_extend(args, { "--rules=@PER-CS" })
            end

            return args
          end,
          stdin = false,
        },
      },
    },
  },

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

  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "V13Axel/neotest-pest",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(
        opts.adapters,
        require("neotest-pest")({
          pest_cmd = function()
            return "vendor/bin/pest"
          end,
          sail_enabled = function()
            return false
          end,
        })
      )
    end,
  },

  {
    "adalessa/laravel.nvim",
    dependencies = {
      "tpope/vim-dotenv",
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "kevinhwang91/promise-async",
    },
    cmd = { "Laravel" },
    event = { "VeryLazy" },
    opts = {},
    config = true,
    keys = {
      { "<localleader>a", ":Laravel artisan<cr>" },
      { "<localleader>r", ":Laravel routes<cr>" },
      { "<localleader>m", ":Laravel related<cr>" },
    },
  },
}
