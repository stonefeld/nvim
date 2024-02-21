return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      integrations = {
        mason = true,
        fidget = true,
      },
      highlight_overrides = {
        all = function(colors)
          return {
            ModeMsg = { fg = colors.yellow },
            htmlTagName = { fg = colors.blue },
            htmlSpecialTagName = { fg = colors.blue },
            htmlTag = { fg = colors.teal },
            htmlEndTag = { fg = colors.teal },
            javaScript = { fg = colors.text },
            djangoTagBlock = { fg = colors.maroon },
            djangoVarBlock = { fg = colors.mauve },
            ["@tag"] = { fg = colors.blue },
            ["@tag.attribute"] = { fg = colors.yellow },
          }
        end,
      },
    },
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = {
      styles = {
        italic = false,
      },
      highlight_groups = {
        ModeMsg = { fg = "gold", bold = true },
      },
    },
  },

  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000,
    opts = {
      italic = {
        strings = false,
        comments = false,
        operators = false,
      },
      contrast = "hard",
      overrides = {
        RainbowDelimiterRed = { link = "TSRainbowRed" },
        RainbowDelimiterOrange = { link = "TSRainbowOrange" },
        RainbowDelimiterYellow = { link = "TSRainbowYellow" },
        RainbowDelimiterGreen = { link = "TSRainbowGreen" },
        RainbowDelimiterBlue = { link = "TSRainbowBlue" },
        RainbowDelimiterCyan = { link = "TSRainbowCyan" },
        RainbowDelimiterViolet = { link = "TSRainbowViolet" },
      },
    },
  },
}
