return {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  opts = {
    progress = {
      suppress_on_insert = true,
      display = {
        done_icon = "✔ ",
      },
    },
    notification = {
      window = {
        winblend = 0,
        x_padding = 0,
        normal_hl = "NormalFloat",
      },
    },
  }
}
