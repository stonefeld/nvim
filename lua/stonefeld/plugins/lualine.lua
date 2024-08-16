return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  opts = {
    options = {
      component_separators = "|",
      section_separators = "",
    },
  },
}
