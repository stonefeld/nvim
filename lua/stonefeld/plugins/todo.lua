return {
  "folke/todo-comments.nvim",
  event = "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local u = require("stonefeld.core.utils")
    require("todo-comments").setup({
      keywords = {
        TODO = { icon = " " },
        HACK = { icon = " " },
        PERF = { icon = " " },
        NOTE = { icon = " " },
        TEST = { icon = " " },
      },
    })

    u.nmap("<leader>ft", ":TodoQuickFix<CR>", "[TODO] Find project-wide TODOs")
  end,
}
