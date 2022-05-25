-- ---------- Markdown options ---------- --
-- Markdown specific options
local options = {
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  textwidth = 80,
  number = false,
  relativenumber = false,
  foldenable = true,
  foldmethod = "marker",
  foldmarker = "<!-- {{{ -->,<!-- }}} -->",
}

-- Setting the options
for k, v in pairs(options) do
  vim.opt_local[k] = v
end

-- Options for the keybindings
local opts = { noremap = true, silent = true, buffer = 0 }

-- Set markdown specific keybindings
vim.keymap.set("n", "<m-m>", "<cmd>w! | silent execute '!md-to-pdf ' . expand('%:p') | redraw!<cr>", opts)
vim.keymap.set("n", "<m-o>", "<cmd> execute '!xdg-open ' . expand('%:r') . '.pdf &' | redraw!<cr>", opts)
vim.keymap.set("i", ";co<tab>", "<!-- {{{ --><cr><!-- }}} --><esc>O", opts)

-- Disable autocomplete for this filetype
local status_ok, cmp = pcall(require, "cmp")
if status_ok then
  cmp.setup.buffer { enabled = false }
end
