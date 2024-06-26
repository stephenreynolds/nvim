return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function(_, opts)
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup(opts)

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpointLine", numhl = "DapBreakpoint" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRejected", linehl = "DapBreakpointLine", numhl = "DapBreakpoint" })
    vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "DapStopped" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "DapLogPointLine", numhl = "DapLogPoint" })

    -- Open and close when debugger is run/terminated.
    dap.listeners.before.attach["dapui_config"] = dapui.open
    dap.listeners.before.launch["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close
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
        require("dapui").eval(nil, { enter = true })
      end,
      desc = "Evaluate expression",
    },
    -- Continue
    {
      "<F1>",
      function()
        require("dap").continue()
      end,
      desc = "Continue",
    },
    -- Step into
    {
      "<F2>",
      function()
        require("dap").step_into()
      end,
      desc = "Step into",
    },
    -- Step over
    {
      "<F3>",
      function()
        require("dap").step_over()
      end,
      desc = "Step over",
    },
    -- Step out
    {
      "<F4>",
      function()
        require("dap").step_out()
      end,
      desc = "Step out",
    },
    -- Step back
    {
      "<F5>",
      function()
        require("dap").step_back()
      end,
      desc = "Step back",
    },
    -- Step back
    {
      "<F12>",
      function()
        require("dap").restart()
      end,
      desc = "Restart",
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
      "<leader>dbb",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle breakpoint",
    },
    -- Set exception breakpoints
    {
      "<leader>dbx",
      function()
        require("dap").set_exception_breakpoints({ "all" })
      end,
      desc = "Set exception breakpoints",
    },
    -- Set log breakpoint
    {
      "<leader>dbl",
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end,
      desc = "Set log breakpoint",
    },
    -- Set conditional breakpoint
    {
      "<leader>dbc",
      function()
        vim.ui.input({ prompt = "Condition: " }, function(input)
          require("dap").set_breakpoint(input, nil, nil)
        end)
      end,
      desc = "Set conditional breakpoint",
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
