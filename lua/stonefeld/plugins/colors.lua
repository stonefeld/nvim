return {
  "stonefeld/gruvbox.nvim",
  priority = 1000,
  opts = { contrast = "hard" },
  init = function()
    vim.cmd.colorscheme("gruvbox")
  end,
}
