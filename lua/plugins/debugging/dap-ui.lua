-- nvim-dap-ui: Debugger interface
return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function(_, opts)
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup(opts)

		vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "🔵", texthl = "DapBreakpointRejected", linehl = "", numhl = "" }
		)
		vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "DapStopped", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
		)
		vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

		-- Open and close when debugger is run/terminated.
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
	end,
	keys = {
		-- Toggle debugger
		{
			"<leader>dd",
			function()
				require("dapui").toggle()
			end,
			desc = "Toggle debugger",
		},
		-- Evaluate expression
		{
			"<leader>de",
			function()
				require("dapui").eval()
			end,
			desc = "Evaluate expression",
			mode = "v",
		},
		-- Continue
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "Continue",
		},
		-- Step over
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
			desc = "Step over",
		},
		-- Step into
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
			desc = "Step into",
		},
		-- Step out
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
			desc = "Step out",
		},
		-- Run last session
		{
			"<leader>dr",
			function()
				require("dap").run_last()
			end,
			desc = "Run last",
		},
		-- Run to cursor
		{
			"<leader>dc",
			function()
				require("dap").run_to_cursor()
			end,
			desc = "Run to cursor",
		},
		-- Open debug REPL
		{
			"<leader>dR",
			function()
				require("dap").repl.open({}, "vsplit")
			end,
			desc = "REPL",
		},
		-- Toggle breakpoint
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle breakpoint",
		},
		-- Set exception breakpoints
		{
			"<leader>dx",
			function()
				require("dap").set_exception_breakpoints({ "all" })
			end,
			desc = "Set exception breakpoints",
		},
		-- Clear breakpoints
		{
			"<leader>dC",
			function()
				require("dap").clear_breakpoints()
				print("Breakpoints cleared.")
			end,
			desc = "Clear breakpoints",
		},
		-- Variable hover
		{
			"<leader>di",
			function()
				require("dap.ui.widgets").hover(function()
					return vim.fn.expand("<cexpr>")
				end)
			end,
			desc = "Hover",
			mode = { "n", "v" },
		},
		-- Scopes
		{
			"<leader>ds",
			function()
				require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes)
			end,
			desc = "Scopes",
		},
		-- Frames
		{
			"<leader>df",
			function()
				require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames)
			end,
			desc = "Frames",
		},
	},
}
