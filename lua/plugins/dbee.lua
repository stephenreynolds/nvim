return {
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup()

      ---@diagnostic disable-next-line: param-type-mismatch
      local base = vim.fs.joinpath(vim.fn.stdpath("state"), "dbee", "notes")
      local pattern = string.format("%s/.*", base)
      vim.filetype.add({
        extension = {
          sql = function(path, _)
            if path:match(pattern) then
              return "sql.dbee"
            end

            return "sql"
          end,
        },

        pattern = {
          [pattern] = "sql.dbee",
        },
      })
    end,
    keys = {
      {
        "<leader>od",
        function()
          require("dbee").toggle()
        end,
        desc = "Open database UI",
      },
    },
  },

  -- Extend auto completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "MattiasMTS/cmp-dbee",
        dependencies = {
          { "kndndrj/nvim-dbee" },
        },
        ft = "sql",
        opts = {},
      },
    },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = "cmp-dbee" })
    end,
  },
}
