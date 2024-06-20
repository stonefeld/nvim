return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    { "mfussenegger/nvim-dap" },
    { "nvim-neotest/nvim-nio" },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup({
      controls = {
        enabled = false,
      },
      layouts = {
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
            { id = "scopes", size = 0.5 },
            { id = "watches", size = 0.5 },
          },
          size = 0.25,
          position = "left",
        },
        {
          elements = {
            { id = "repl", size = 0.5 },
            { id = "variables", size = 0.5 },
          },
          size = 0.3,
          position = "bottom",
        },
      },
    })

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

    -- configure the lldp adapter
    dap.adapters.lldb = {
      type = "executable",
      command = "/usr/bin/lldb-vscode",
      name = "lldb",
    }

    -- user lldp adapter for c code
    dap.configurations.c = {
      {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }

    -- set keybindings for dap
    vim.keymap.set("n", "<F5>", dap.continue, { silent = true })
    vim.keymap.set("n", "<leader><F5>", dap.terminate, { silent = true })
    vim.keymap.set("n", "<F10>", dap.step_over, { silent = true })
    vim.keymap.set("n", "<F11>", dap.step_into, { silent = true })
    vim.keymap.set("n", "<F12>", dap.step_out, { silent = true })
    vim.keymap.set("n", "<leader>gb", dap.run_to_cursor, { silent = true })
    vim.keymap.set("n", "<leader>?", function()
      dapui.eval(nil, { enter = true })
    end, { silent = true })
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { silent = true })
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { silent = true })
    vim.keymap.set("n", "<leader>lp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, { silent = true })
  end,
}
