-- ---------- C options ---------- --
-- C specific options
local options = {
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = false,
  smarttab = true,
  autoindent = true,
  cindent = true,
  cinoptions = "(0,l1,t0,=0",
}

-- Setting the options
for k, v in pairs(options) do
  vim.opt_local[k] = v
end

-- Options for the keybindings
local opts = { noremap = true, silent = true, buffer = 0 }

-- Set c specific keybindings
vim.keymap.set("n", "<m-m>", "<cmd>w! | execute '!compiler ' . expand('%:p')<cr>", opts)
