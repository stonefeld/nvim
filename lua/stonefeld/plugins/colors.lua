local colors = "gruvbox"
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
    opts = { flavour = "macchiato" },
    init = set_colors("catppuccin"),
  },
  {
    "stonefeld/gruvbox.nvim",
    priority = 1000,
    opts = {
      -- contrast = "hard",
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
    },
    init = set_colors("gruvbox"),
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    name = "onedark",
    init = set_colors("onedark"),
  },
  {
    "rose-pine/neovim",
    priority = 1000,
    name = "rose-pine",
    opts = {
      variant = "moon",
      styles = { italic = false },
    },
    init = set_colors("rose-pine"),
  },
}
