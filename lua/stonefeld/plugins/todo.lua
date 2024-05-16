return {
  "folke/todo-comments.nvim",
  event = "VimEnter",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "folke/trouble.nvim" },
  },
  config = function()
    require("todo-comments").setup({
      keywords = {
        HACK = { icon = " " },
        PERF = { icon = " " },
        NOTE = { icon = " " },
        TEST = { icon = " " },
      },
    })

    vim.keymap.set("n", "<leader>fn", ":TodoTrouble<CR>", { silent = true, desc = "Find TODOs" })
  end,
}
