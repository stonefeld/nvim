return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = true,
  init = function()
    vim.cmd.colorscheme("kanagawa-dragon")
  end,
}
