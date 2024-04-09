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
        php = { "php_cs_fixer" },
      },
    },
    config = function(_, opts)
      local cs_fixer = require("conform.formatters.php_cs_fixer")
      cs_fixer.args = function(_, ctx)
        local args = { "fix", "$FILENAME", "--quiet", "--no-interaction", "--using-cache=no" }
        local found = vim.fs.find(".php-cs-fixer.php", { upward = true, path = ctx.dirname })[1]
        if found then
          vim.list_extend(args, { "--config=" .. found })
        else
          vim.list_extend(args, { "--rules=@PSR12,@Symfony" })
        end

        return args
      end

      require("conform").setup(opts)
    end,
  },
}
