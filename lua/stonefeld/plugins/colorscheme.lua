return {
  -- "ellisonleao/gruvbox.nvim",
  -- priority = 1000,
  -- config = function()
  --   local gruvbox = require("gruvbox")
  --
  --   gruvbox.setup({
  --     italic = {
  --       strings = false,
  --       comments = false,
  --       folds = false,
  --     },
  --   })
  --   vim.cmd([[ colorscheme gruvbox ]])
  -- end,
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local catppuccin = require("catppuccin")

    catppuccin.setup({
      flavour = "macchiato",
      integrations = {
        mason = true,
        ts_rainbow2 = true,
      },
      highlight_overrides = {
        all = function(colors)
          return {
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

    vim.cmd([[ colorscheme catppuccin ]])
  end,
}
