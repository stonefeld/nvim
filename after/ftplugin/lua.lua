-- ---------- Lua options ---------- --
-- Lua specific options
local options = {
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
}

-- Setting the options
for k, v in pairs(options) do
  vim.opt_local[k] = v
end
