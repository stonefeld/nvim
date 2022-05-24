-- ---------- Colorscheme ---------- --
-- Specify the wanted colorscheme
local colorscheme = "nordokai"

-- Nordokai colorscheme configuration
vim.g.nordokai_style = "nord"
vim.g.nordokai_transparent_background = 1
vim.g.nordokai_menu_selection_background = "gray"
vim.g.nordokai_sign_column_background = "default"
vim.g.nordokai_current_word = "gray background"
vim.g.nordokai_diagnostic_line_highlight = 0
vim.g.nordokai_better_performance = 0
vim.g.nordokai_transparent_float = 1
vim.g.nordokai_italic_comments = 1
vim.g.nordokai_invert_selecion = 1

-- Make a protected call in case the colorscheme is not installed
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
