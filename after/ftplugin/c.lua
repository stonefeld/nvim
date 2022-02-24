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
