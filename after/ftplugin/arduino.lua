-- ---------- C options ---------- --
-- C specific options
local options = {
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  cinoptions = "(0,W4,w1,m1,l1,t0,g0",
}

-- Setting the options
for k, v in pairs(options) do
  vim.opt_local[k] = v
end
