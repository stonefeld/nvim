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
      transparent_background = true,
      integrations = {
        fidget = true,
        mason = true,
      },
    })

    vim.cmd([[ colorscheme catppuccin ]])
  end,
}
