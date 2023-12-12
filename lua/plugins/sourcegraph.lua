return {
  "sourcegraph/sg.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<leader>sg",
      function()
        require("sg.extensions.telescope").fuzzy_search_results()
      end,
      desc = "Search using SourceGraph",
    },
  },
}
