local slow_format_filetypes = {}

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

      -- Run slow formatters async
      if slow_format_filetypes[vim.bo[bufnr].filetype] then
        return
      end
      local function on_format(err)
        if err and err:match("timeout$") then
          slow_format_filetypes[vim.bo[bufnr].filetype] = true
        end
      end

      return { timeout_ms = 500, lsp_fallback = true }, on_format
    end,
    format_after_save = function(bufnr)
      if not slow_format_filetypes[vim.bo[bufnr].filetype] then
        return
      end
      return { lsp_fallback = true }
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      fish = { "fish_indent" },
      sh = { "shfmt" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)

    local create_user_command = vim.api.nvim_create_user_command

    create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })

    create_user_command("FormatDisable", function(args)
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

    create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
      print("Enabled format on save.")
    end, {
      desc = "Enable format on save",
    })

    create_user_command("FormatToggle", function(args)
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
      "<leader>lff",
      "<cmd>Format<cr>",
      desc = "Format buffer",
    },
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
