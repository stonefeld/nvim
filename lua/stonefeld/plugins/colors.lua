return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "macchiato",
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
    config = function()
      local gruvbox = require("gruvbox")
      local colors = gruvbox.palette

      gruvbox.setup({
        italic = {
          strings = false,
          comments = false,
          operators = false,
        },
        contrast = "hard",
        overrides = {
          TelescopeNormal = { bg = colors.dark0 },
          TelescopePromptBorder = { fg = colors.bright_yellow, bg = colors.dark0 },
          TelescopeResultsBorder = { fg = colors.bright_blue, bg = colors.dark0 },
          TelescopePreviewBorder = { fg = colors.bright_blue, bg = colors.dark0 },
          TelescopeSelection = { fg = colors.bright_orange, bg = colors.dark1 },
          TelescopeSelectionCaret = { fg = colors.bright_red, bg = colors.dark1 },

          SignColumn = { link = "Normal" },
          GruvboxGreenSign = { bg = "" },
          GruvboxOrangeSign = { bg = "" },
          GruvboxPurpleSign = { bg = "" },
          GruvboxYellowSign = { bg = "" },
          GruvboxRedSign = { bg = "" },
          GruvboxBlueSign = { bg = "" },
          GruvboxAquaSign = { bg = "" },
        },
      })
    end,
  },

  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,
    opts = { style = "night" },
  },

  {
    "Mofiqul/vscode.nvim",
    name = "vscode",
    priority = 1000,
    config = true,
  },
}
