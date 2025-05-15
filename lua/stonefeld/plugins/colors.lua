local colors = "tairiki"
local set_colors = function(colorscheme)
  if colors == colorscheme then
    return function()
      vim.cmd.colorscheme(colorscheme)
    end
  end
  return nil
end

return {
  {
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",
    init = set_colors("catppuccin"),
    opts = {
      no_italic = true,
      background = { dark = "mocha" },
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    init = set_colors("gruvbox"),
    opts = {
      italic = {
        strings = false,
        comments = false,
      },
    },
  },
  {
    "deparr/tairiki.nvim",
    priority = 1000,
    name = "tairiki",
    init = set_colors("tairiki"),
    opts = {
      diagnostics = { darker = true },
      plugins = { auto = true },
    },
  },
}
