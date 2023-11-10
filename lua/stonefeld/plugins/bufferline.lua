return {
  "akinsho/bufferline.nvim",
  dependencies = {
    { "catppuccin/nvim" },
  },
  after = "catppuccin",
  config = function()
    local catppuccin_theme = require("catppuccin.groups.integrations.bufferline")
    require("bufferline").setup({
      highlights = catppuccin_theme.get(),
    })
  end,
}
