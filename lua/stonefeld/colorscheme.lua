-- ---------- Colorscheme ---------- --
-- Specify the wanted colorscheme
local colorscheme = "catppuccin"

-- Gruvbox colorscheme configuration
vim.g.gruvbox_transparent_bg = 1
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_invert_selection = 0

-- Catppuccin flavour setup
vim.g.catppuccin_flavour = "mocha"

-- Make a protected call in case the colorscheme is not installed
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found!")
  return
end
