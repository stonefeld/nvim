local colors = "tokyonight"
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
    -- opts = { no_italic = true },
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
    "folke/tokyonight.nvim",
    priority = 1000,
    init = set_colors("tokyonight"),
    opts = { style = "moon" },
  },
}
