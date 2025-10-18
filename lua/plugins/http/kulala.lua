return {
  {
    "mistweaverco/kulala.nvim",
    opts = {},
    keys = {
      {
        "<leader>qs",
        function()
          require("kulala").scratchpad()
        end,
        desc = "Open scratchpad",
      },
      {
        "<leader>qr",
        function()
          require("kulala").run()
        end,
        desc = "Run current request",
      },
      {
        "<leader>qR",
        function()
          require("kulala").replay()
        end,
        desc = "Replay last request",
      },
      {
        "<leader>qc",
        function()
          require("kulala").copy()
        end,
        desc = "Copy request to clipboard",
      },
      {
        "<leader>qx",
        function()
          require("kulala").close()
        end,
        desc = "Close query window",
      },
      {
        "<leader>qq",
        function()
          require("kulala").toggle_view()
        end,
        desc = "Toggle between body/headers",
      },
      {
        "<leader>qG",
        function()
          require("kulala").download_graphql_schema()()
        end,
        desc = "Download GraphQL schema",
      },
    },
  },

  {
    "folke/which-key.nvim",
    optional = true,
    opts = function()
      require("which-key").add({
        { "<leader>q", group = "+query" },
      })
    end,
  },
}
