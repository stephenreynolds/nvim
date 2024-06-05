return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  dependencies = { "mason.nvim" },
  cmd = "ConformInfo",
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_fallback = true }
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      fish = { "fish_indent" },
      sh = { "shfmt" },
      javascript = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
        print("Disabled format on save for this buffer.")
      else
        vim.g.disable_autoformat = true
        print("Disabled format on save.")
      end
    end, {
      desc = "Disable format on save",
      bang = true,
    })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
      print("Enabled format on save.")
    end, {
      desc = "Enable format on save",
    })
    vim.api.nvim_create_user_command("FormatToggle", function(args)
      if args.bang then
        vim.b.disable_autoformat = not vim.b.disable_autoformat
        if vim.b.disable_autoformat then
          print("Disabled format on save for this buffer.")
        else
          print("Enabled format on save for this buffer.")
        end
      else
        vim.g.disable_autoformat = not vim.g.disable_autoformat
        if vim.g.disable_autoformat then
          print("Disabled format on save.")
        else
          print("Enabled format on save.")
        end
      end
    end, {
      desc = "Toggle format on save",
      bang = true,
    })
  end,
  keys = {
    {
      "<leader>lft",
      "<cmd>FormatToggle<cr>",
      desc = "Toggle format on save",
    },
    {
      "<leader>lfb",
      "<cmd>FormatToggle!<cr>",
      desc = "Toggle format on save for this buffer",
    },
  },
}
