return {
  "nvim-dap-go",
  dependencies = {
    "mfussenegger/nvim-dap"
  },
  cond = function()
    return vim.fn.executable("delve") == 1
  end,
}
