return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      local catppuccin = require("catppuccin")

      catppuccin.setup({
        flavour = "macchiato",
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
      })
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      local rose_pine = require("rose-pine")

      rose_pine.setup({
        styles = {
          italic = false,
        },
        highlight_groups = {
          ModeMsg = { fg = "gold", bold = true },
        },
      })
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000,
    config = function()
      local gruvbox = require("gruvbox")

      gruvbox.setup({
        italic = {
          strings = false,
          comments = false,
          operators = false,
        },
      })
    end,
  },
}
