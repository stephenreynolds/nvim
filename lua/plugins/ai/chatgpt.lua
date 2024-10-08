return {
  "jackMort/ChatGPT.nvim",
  enabled = false,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    api_key_cmd = vim.fn.executable("nixos-version") == 1 and "cat /run/secrets/openai-api-key" or os.getenv("OPENAI_API_KEY"),
    popup_input = {
      submit = "<C-s>",
    },
  },
  keys = {
    {
      "<leader>ii",
      "<cmd>ChatGPT<cr>",
      desc = "Chat",
    },
    {
      "<leader>ia",
      "<cmd>ChatGPTActAs<cr>",
      desc = "Act as",
    },
    {
      "<leader>ic",
      "<cmd>ChatGPTCompleteCode<cr>",
      desc = "Complete code",
    },
    {
      "<leader>ie",
      "<cmd>ChatGPTEditWithInstructions<cr>",
      mode = "v",
      desc = "Edit with instructions",
    },
    {
      "<leader>ig",
      "<cmd>ChatGPTRun grammar_correction<cr>",
      mode = "v",
      desc = "Grammar correction",
    },
    {
      "<leader>iT",
      "<cmd>ChatGPTRun translate<cr>",
      mode = "v",
      desc = "Translate",
    },
    {
      "<leader>ik",
      "<cmd>ChatGPTRun keyword<cr>",
      mode = "v",
      desc = "Keywords",
    },
    {
      "<leader>id",
      "<cmd>ChatGPTRun docstring<cr>",
      mode = "v",
      desc = "Docstring",
    },
    {
      "<leader>it",
      "<cmd>ChatGPTRun add_tests<cr>",
      mode = "v",
      desc = "Add tests",
    },
    {
      "<leader>io",
      "<cmd>ChatGPTRun optimize_code<cr>",
      mode = "v",
      desc = "Optimize",
    },
    {
      "<leader>is",
      "<cmd>ChatGPTRun summarize<cr>",
      mode = "v",
      desc = "Summarize",
    },
    {
      "<leader>if",
      "<cmd>ChatGPTRun fix_bugs<cr>",
      mode = "v",
      desc = "Fix bugs",
    },
    {
      "<leader>ix",
      "<cmd>ChatGPTRun explain_code<cr>",
      mode = "v",
      desc = "Explain",
    },
    {
      "<leader>ir",
      "<cmd>ChatGPTRun code_readability_analysis<cr>",
      mode = "v",
      desc = "Code readability",
    },
  },
}
