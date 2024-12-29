return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
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
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
    },
    build = "make tiktoken",
    config = function()
      local copilot = require("CopilotChat")
      local selections = require("CopilotChat.select")
      local u = require("stonefeld.core.utils")

      copilot.setup({
        show_folds = false,
        show_help = false,
        -- auto_insert_mode = true,
        insert_at_end = true,
        window = {
          width = 0.3,
          -- border = "solid",
        },
        mappings = {
          complete = {
            insert = "",
          },
        },
      })

      u.nmap("<leader>cc", ":CopilotChatToggle<CR>", "[Copilot] Toggle Chat")
      u.nmap("<leader>cq", function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          copilot.ask(input, { selection = selections.buffer })
        end
      end, "[Copilot] Quick Chat")

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-*",
        callback = function()
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
          vim.opt_local.signcolumn = "no"

          u.nmap("j", "gj", "[Copilot] Move in wrapped lines", { buffer = 0 })
          u.nmap("k", "gk", "[Copilot] Move in wrapped lines", { buffer = 0 })
          u.nmap("$", "g$", "[Copilot] Move in wrapped lines", { buffer = 0 })
          u.nmap("0", "g0", "[Copilot] Move in wrapped lines", { buffer = 0 })
        end,
      })
    end,
  },
}
