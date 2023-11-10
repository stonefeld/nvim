return {
  "freddiehaddad/feline.nvim",
  dependencies = {
    { "catppuccin/nvim" },
  },
  config = function()
    local catppuccin_theme = require("catppuccin.groups.integrations.feline")
    require("feline").setup({
      components = catppuccin_theme.get(),
    })
  end,
}
