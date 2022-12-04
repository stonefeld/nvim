-- ---------- Colorscheme ---------- --
-- Specify the wanted colorscheme
local colorscheme = "catppuccin"

-- Make a protected call in case the colorscheme is not installed
pcall(require, "stonefeld.colors." .. colorscheme)
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("Colorscheme " .. colorscheme .. " not found!")
	return
end
