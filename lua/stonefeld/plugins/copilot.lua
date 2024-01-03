return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    local copilot = require("copilot")

    copilot.setup({
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
          dismiss = "<M-e>",
        },
      },
    })
  end,
}
