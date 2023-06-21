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
	keys = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local widgets = require("dap.ui.widgets")
		return {
			-- Toggle debugger
			{
				"<leader>dd",
				dapui.toggle,
				desc = "Toggle debugger",
			},
			-- Evaluate expression
			{
				"<leader>de",
				dapui.eval,
				desc = "Evaluate expression",
				mode = "v",
			},
			-- Continue
			{
				"<F5>",
				dap.continue,
				desc = "Continue",
			},
			-- Step over
			{
				"<F10>",
				dap.step_over,
				desc = "Step over",
			},
			-- Step into
			{
				"<F11>",
				dap.step_into,
				desc = "Step into",
			},
			-- Step out
			{
				"<F12>",
				dap.step_out,
				desc = "Step out",
			},
			-- Run last session
			{
				"<leader>dr",
				dap.run_last,
				desc = "Run last",
			},
			-- Run to cursor
			{
				"<leader>dc",
				dap.run_to_cursor,
				desc = "Run to cursor",
			},
			-- Open debug REPL
			{
				"<leader>dR",
				function()
					dap.repl.open({}, "vsplit")
				end,
				desc = "REPL",
			},
			-- Toggle breakpoint
			{
				"<leader>db",
				dap.toggle_breakpoint,
				desc = "Toggle breakpoint",
			},
			-- Set exception breakpoints
			{
				"<leader>dx",
				function()
					dap.set_exception_breakpoints({ "all" })
				end,
				desc = "Set exception breakpoints",
			},
			-- Clear breakpoints
			{
				"<leader>dC",
				function()
					dap.clear_breakpoints()
					print("Breakpoints cleared.")
				end,
				desc = "Clear breakpoints",
			},
			-- Variable hover
			{
				"<leader>di",
				function()
					widgets.hover(function()
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
					widgets.centered_float(widgets.scopes)
				end,
				desc = "Scopes",
			},
			-- Frames
			{
				"<leader>df",
				function()
					widgets.centered_float(widgets.frames)
				end,
				desc = "Frames",
			},
		}
	end,
}
