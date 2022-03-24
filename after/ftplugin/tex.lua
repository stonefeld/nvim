-- ---------- Latex options ---------- --
-- Latex specific options
local options = {
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  textwidth = 80,
  number = false,
  relativenumber = false,
  laststatus = 0,
}

-- Setting the options
for k, v in pairs(options) do
  vim.opt_local[k] = v
end

-- Options for the keybindings
local opts = { noremap = true, silent = true, buffer = 0 }

-- Set latex specific keybindings
vim.keymap.set("n", "<m-m>", "<cmd>w! | execute '!compiler ' . expand('%:p')<cr>", opts)
vim.keymap.set("n", "<m-o>", "<cmd> execute '!xdg-open ' . expand('%:r') . '.pdf &' | redraw!<cr>", opts)
