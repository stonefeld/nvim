-- ---------- Colorscheme ---------- --
-- Specify the wanted colorscheme
local colorscheme = "masita"

-- Nordokai colorscheme configuration
vim.g.nordokai_style = "nord"
vim.g.nordokai_transparent_background = 1
vim.g.nordokai_menu_selection_background = "gray"
vim.g.nordokai_transparent_float = 0
vim.g.nordokai_italic_comments = 1
vim.g.nordokai_invert_selecion = 0
vim.g.nordokai_highlight_completion = 1

-- Gruvbox colorscheme configuration
vim.g.gruvbox_transparent_bg = 1
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_invert_selection = 0

-- Make a protected call in case the colorscheme is not installed
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found!")
  return
end
