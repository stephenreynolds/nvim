local chatgpt = require("chatgpt")

chatgpt.setup({
  popup_input = {
    submit = "<C-s>"
  }
})

vim.keymap.set("n", "<leader>ic", "<cmd>ChatGPT<cr>", { desc = "Chat" })
vim.keymap.set("n", "<leader>ia", "<cmd>ChatGPTActAs<cr>", { desc = "Act as" })
vim.keymap.set("v", "<leader>ie", chatgpt.edit_with_instructions, { desc = "Edit with instructions" })
vim.keymap.set("v", "<leader>ig", "<cmd>ChatGPTRun grammar_correction<cr>", { desc = "Grammar correction" })
vim.keymap.set("v", "<leader>iT", "<cmd>ChatGPTRun translate<cr>", { desc = "Translate" })
vim.keymap.set("v", "<leader>ik", "<cmd>ChatGPTRun keyword<cr>", { desc = "Keywords" })
vim.keymap.set("v", "<leader>id", "<cmd>ChatGPTRun docstring<cr>", { desc = "Docstring" })
vim.keymap.set("v", "<leader>it", "<cmd>ChatGPTRun add_tests<cr>", { desc = "Add tests" })
vim.keymap.set("v", "<leader>io", "<cmd>ChatGPTRun optimize_code<cr>", { desc = "Optimize" })
vim.keymap.set("v", "<leader>is", "<cmd>ChatGPTRun summarize<cr>", { desc = "Summarize" })
vim.keymap.set("v", "<leader>if", "<cmd>ChatGPTRun fix_bugs<cr>", { desc = "Fix bugs" })
vim.keymap.set("v", "<leader>ie", "<cmd>ChatGPTRun explain_code<cr>", { desc = "Explain" })
vim.keymap.set("v", "<leader>ir", "<cmd>ChatGPTRun code_readability_analysis<cr>", { desc = "Code readability" })
