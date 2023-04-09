local dap = require("dap")
local dapui = require("dapui")
local mason_dap = require("mason-nvim-dap")
local widgets = require("dap.ui.widgets")

require("mason").setup()
dapui.setup()

mason_dap.setup({
    ensure_installed = {
        "codelldb"
    },
    automatic_setup = true,
    handlers = {
        function(config)
            mason_dap.default_setup(config)
        end
    }
})

vim.fn.sign_define("DapBreakpoint", { text = "🔴" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🔵" })
vim.fn.sign_define("DapStopped", { text = "🟢" })

-- Open and close when debugger is run/terminated.
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

-- Keymaps

-- Toggle debugger
vim.keymap.set("n", "<leader>dd", dapui.toggle, { desc = "Toggle debugger" })
-- Continue
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continue" })
-- Step over
vim.keymap.set("n", "<F8>", dap.step_over, { desc = "Step over" })
-- Step into
vim.keymap.set("n", "<F7>", dap.step_into, { desc = "Step into" })
-- Step out
vim.keymap.set("n", "<S-F8>", dap.step_out, { desc = "Step out" })
-- Run last session
vim.keymap.set("n", "<leader>dr", dap.run_last, { desc = "Run last" })
-- Run to cursor
vim.keymap.set("n", "<leader>dc", dap.run_to_cursor, { desc = "Run to cursor" })
-- Open debug REPL
vim.keymap.set("n", "<leader>dR", function() dap.repl.open({}, "vsplit") end, { desc = "REPL" })
-- Evaluate expression
vim.keymap.set("v", "<leader>de", dapui.eval, { desc = "Evaluate expression" })
-- Toggle breakpoint
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
-- Set exception breakpoints
vim.keymap.set("n", "<leader>dx", function()
    dap.set_exception_breakpoints({ "all" })
end, { desc = "Set exception breakpoints" })
-- Clear breakpoints
vim.keymap.set("n", "<leader>dC", function()
    dap.clear_breakpoints()
    print("Breakpoints cleared.")
end, { desc = "Clear breakpoints" })
-- Variable hover
vim.keymap.set("n", "<leader>di", function()
    require("dap.ui.widgets").hover(function()
        return vim.fn.expand("<cexpr>")
    end)
end, { desc = "Hover" })
-- Scopes
vim.keymap.set("n", "<leader>ds", function() widgets.centered_float(widgets.scopes) end, { desc = "Scopes" })
