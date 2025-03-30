local colors = "catppuccin"
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
      flavour = "mocha",
      integrations = {
        noice = true,
        notify = true,
        nvimtree = true,
      },
    },
  },
}
