return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  config = function()
    local u = require("stonefeld.core.utils")

    require("neogit").setup({})

    u.nmap("<leader>gs", ":Neogit<CR>", "[Neogit] Git status")
    u.nmap("<leader>gc", ":Neogit commit<CR>", "[Neogit] Git commit")
    u.nmap("<leader>gp", ":Neogit pull<CR>", "[Neogit] Git pull")
    u.nmap("<leader>gP", ":Neogit push<CR>", "[Neogit] Git push")
    u.nmap("<leader>gd", ":DiffviewOpen<CR>", "[Neogit] Git diff")
  end,
}
