return {
  "folke/todo-comments.nvim",
  event = "VimEnter",
  dependencies = "nvim-lua/plenary.nvim",
  init = function()
    local u = require("stonefeld.core.utils")
    u.nmap("<leader>ft", ":TodoQuickFix<CR>", "[TODO] Find project-wide TODOs")
  end,
  opts = {
    highlight = { multiline = false },
  },
}
