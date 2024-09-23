return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "rcarriga/nvim-dap-ui", dependencies = "nvim-neotest/nvim-nio" },
    { "jay-babu/mason-nvim-dap.nvim", dependencies = "williamboman/mason.nvim" },
  },
  lazy = true,
  cmd = { "DapContinue", "DapToggleBreakpoint" },
  init = function()
    local u = require("stonefeld.core.utils")

    u.nmap("<leader>ds", ":tabe % | DapContinue<CR>", "[DAP] Start debugging session")
    u.nmap("<leader>b", ":DapToggleBreakpoint<CR>", "[DAP] Toggle breakpoint")
  end,
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local u = require("stonefeld.core.utils")

    dapui.setup({
      controls = {
        enabled = false,
      },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.5 },
            { id = "watches", size = 0.5 },
          },
          size = 0.25,
          position = "left",
        },
        {
          elements = {
            { id = "breakpoints", size = 0.5 },
            { id = "stacks", size = 0.5 },
          },
          size = 0.25,
          position = "right",
        },
        {
          elements = {
            { id = "repl", size = 0.5 },
            { id = "console", size = 0.5 },
          },
          size = 0.3,
          position = "bottom",
        },
      },
    })

    require("mason-nvim-dap").setup({ handlers = {} })

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    u.nmap("<leader>dt", ":DapTerminate<CR>:tabc<CR>", "[DAP] Terminate debugging session")
    u.nmap("<F5>", dap.continue, "[DAP] Continue")
    u.nmap("<F10>", dap.step_over, "[DAP] Step over")
    u.nmap("<F11>", dap.step_into, "[DAP] Step into")
    u.nmap("<F12>", dap.step_out, "[DAP] Step out")
    u.nmap("<leader>gb", dap.run_to_cursor, "[DAP] Run to cursor")
    u.nmap("<leader>?", function()
      dapui.eval(nil, { enter = true })
    end, "[DAP] Evaluate expression")
    u.nmap("<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, "[DAP] Set breakpoint with condition")
    u.nmap("<leader>lp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, "[DAP] Set log point")
  end,
}
