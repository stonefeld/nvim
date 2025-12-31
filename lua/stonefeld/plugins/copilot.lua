return {
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
}
