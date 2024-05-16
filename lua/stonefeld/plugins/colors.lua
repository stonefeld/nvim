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
        mini = {
          enabled = true,
        },
      },
      highlight_overrides = {
        all = function(colors)
          return {
            TelescopeNormal = { link = "NormalFloat" },
            TelescopeBorder = { fg = colors.blue, bg = colors.mantle },
            TelescopePromptBorder = { fg = colors.peach, bg = colors.mantle },
            TelescopePromptTitle = { fg = colors.peach, bg = colors.mantle },

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
      invert_selection = true,
      contrast = "hard",
      overrides = {
        GitSignsAdd = { link = "DiagnosticSignOk" },
        GitSignsChange = { link = "DiagnosticSignWarn" },
        GitSignsDelete = { link = "DiagnosticSignError" },
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

  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,
    opts = { style = "night" },
  },
}
