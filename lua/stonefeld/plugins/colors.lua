return {
  "stonefeld/gruvbox.nvim",
  priority = 1000,
  opts = {
    contrast = "hard",
    italic = {
      strings = false,
      emphasis = false,
      comments = false,
      operators = false,
      folds = false,
    },
  },
  init = function()
    vim.cmd.colorscheme("gruvbox")
  end,
}
