-- ---------- Markdown options ---------- --
-- Markdown specific options
local options = {
  number = false,
  relativenumber = false,
}

-- Setting the options
for k, v in pairs(options) do
  vim.opt_local[k] = v
end

-- Options for the keybindings
local opts = { noremap = true, silent = true, buffer = 0 }

-- Set markdown specific keybindings
vim.keymap.set("n", "q", "<cmd>q<cr>", opts)
