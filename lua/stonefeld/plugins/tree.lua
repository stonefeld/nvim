return {
  "nvim-tree/nvim-tree.lua",
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  config = function()
    local u = require("stonefeld.core.utils")

    require("nvim-tree").setup({
      view = {
        width = 35,
      },
    })

    u.nmap("<C-n>", ":NvimTreeToggle<CR>")
  end,
}
