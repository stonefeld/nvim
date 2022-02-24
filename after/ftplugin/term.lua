-- ---------- Terminal options ---------- --
-- Terminal specific options
local options = {
  scrolloff = 0,
  sidescrolloff = 0,
  number = false,
  relativenumber = false,
  wrap = true,
  scrollback = 5000,
  signcolumn = "no",
  colorcolumn = "0",
}

-- Setting the options
for k, v in pairs(options) do
  vim.opt_local[k] = v
end
