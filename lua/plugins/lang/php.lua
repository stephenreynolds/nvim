return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
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
      vim.list_extend(opts.ensure_installed, {
        -- "intelephense",
        "phpactor",
        "php-cs-fixer",
        "pint",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- intelephense = {
        --   licenceKey = vim.fn.executable("nixos-version") == 1 and "cat /run/secrets/intelephense-key" or os.getenv("INTELEPHENSE_KEY"),
        -- },
        phpactor = {
          ["language_server_phpstan.enabled"] = true,
          ["language_server_php_cs_fixer.enabled"] = false,
          ["language_server.diagnostics_on_update"] = false,
          ["worse_reflection.stub_dir"] = "%application_root%",
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = { "pint", "php-cs-fixer", stop_after_first = true },
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
        pint = {
          meta = {
            url = "https://github.com/laravel/pint",
            description = "Laravel Pint is an opinionated PHP code style fixer for minimalists. Pint is built on top of PHP-CS-Fixer and makes it simple to ensure that your code style stays clean and consistent.",
          },
          command = require("conform.util").find_executable({
            vim.fn.stdpath("data") .. "/mason/bin/pint",
            "vendor/bin/pint",
          }, "pint"),
          args = { "$FILENAME" },
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
            vim.fn.expand("$MASON/packages/php-debug-adapter/extension/out/phpDebug.js"),
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
    ft = { "php" },
    cmd = { "Laravel" },
    event = { "VeryLazy" },
    opts = {},
    config = function()
      vim.keymap.set("n", "<localleader>a", "<cmd>Laravel artisan<cr>", { desc = "Artisan" })
      vim.keymap.set("n", "<localleader>r", "<cmd>Laravel routes<cr>", { desc = "Routes" })
      vim.keymap.set("n", "<localleader>m", "<cmd>Laravel related<cr>", { desc = "Related" })
    end,
  },

  {
    "ccaglak/phptools.nvim",
    ft = { "php" },
    config = function()
      require("phptools").setup({
        ui = {
          enable = true,
        },
      })
    end,
  },
}
