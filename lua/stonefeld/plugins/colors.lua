return {
  "ellisonleao/gruvbox.nvim",
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
    overrides = {
      Normal = { bg = "" },
      SignColumn = { link = "Normal" },
      GruvboxGreenSign = { bg = "" },
      GruvboxOrangeSign = { bg = "" },
      GruvboxPurpleSign = { bg = "" },
      GruvboxYellowSign = { bg = "" },
      GruvboxRedSign = { bg = "" },
      GruvboxBlueSign = { bg = "" },
      GruvboxAquaSign = { bg = "" },
    },
  },
  init = function()
    vim.cmd.colorscheme("gruvbox")
  end,
}
