return {
  "chrishrb/gx.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "Browse" },
  init = function()
    vim.g.netrw_nogx = 1
  end,
  config = function()
    require("gx").setup({
      handlers = {
        nix = {
          filetype = { "nix" },
          handle = function(mode, line, _)
            local user = require("gx.helper").find(line, mode, "github:(%w+)/.+")
            local repo = require("gx.helper").find(line, mode, "github:%w+/(%w+).*")
            return "https://github.com/" .. user .. "/" .. repo
          end,
        },
        rust = { -- custom handler to open rust's cargo packages
          filetype = { "toml" }, -- you can also set the required filetype for this handler
          filename = "Cargo.toml", -- or the necessary filename
          handle = function(mode, line, _)
            local crate = require("gx.helper").find(line, mode, "(%w+)%s-=%s")

            if crate then
              return "https://crates.io/crates/" .. crate
            end
          end,
        },
      },
    })
  end,
  keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
}
