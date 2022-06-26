-- ---------- C++ options ---------- --
-- C++ specific options
local options = {
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
}

-- Setting the options
for k, v in pairs(options) do
  vim.opt_local[k] = v
end
