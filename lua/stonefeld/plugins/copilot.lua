return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    init = function()
      local u = require("stonefeld.core.utils")

      u.nmap("<leader>ct", "<cmd>Copilot toggle<cr>", "[Copilot] Toggle")
    end,
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<M-y>",
          accept_word = "<M-w>",
          dismiss = "<M-e>",
        },
      },
    },
  },
  {
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = {
        "zbirenbaum/copilot.lua",
        { "nvim-lua/plenary.nvim", branch = "master" },
      },
      build = "make tiktoken",
      config = function()
        local u = require("stonefeld.core.utils")
        local chat = require("CopilotChat")

        chat.setup({
          window = { width = 0.4 },
        })

        u.nmap("<leader>cc", chat.open, "[Copilot Chat] Open chat")

        vim.api.nvim_create_autocmd("BufEnter", {
          pattern = "copilot-*",
          callback = function()
            vim.opt_local.relativenumber = false
            vim.opt_local.number = false
            vim.opt_local.conceallevel = 0
            vim.opt_local.signcolumn = "no"
            vim.opt_local.foldmethod = "manual"
            vim.opt_local.colorcolumn = ""
            vim.opt_local.cursorline = false
          end,
        })
      end,
    },
  },
}
