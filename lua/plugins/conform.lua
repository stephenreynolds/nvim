return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" },
      css = { { "prettierd", "prettier" } },
      go = { "gofmt" },
      graphql = { { "prettierd", "prettier" } },
      html = { { "prettierd", "prettier" } },
      -- javascript = { { "prettierd", "prettier" } },
      -- javascriptreact = { { "prettierd", "prettier" } },
      json = { "jq" },
      lua = { "stylua" },
      markdown = { { "prettierd", "prettier" } },
      nix = { "nixpkgs-fmt" },
      ocaml = { "ocamlformat" },
      python = { "isort", "black" },
      rust = { "rustfmt" },
      scss = { { "prettierd", "prettier" } },
      bash = { "shellcheck" },
      svelte = { { "prettierd", "prettier" } },
      -- typescript = { { "prettierd", "prettier" } },
      -- typescriptreact = { { "prettierd", "prettier" } },
      yaml = { "yamlfmt" },
      ["_"] = { "trim_whitespace" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
  config = function(_, opts)
    local conform = require("conform")
    conform.setup(opts)

    vim.keymap.set("n", "<leader>lf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { remap = false, desc = "Format" })
  end,
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
