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
}
