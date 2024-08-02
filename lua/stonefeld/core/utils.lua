local M = {}

M.map = function(mode, keys, func, desc, opts)
  opts = opts or { noremap = true, silent = true }
  opts.desc = desc or ""
  vim.keymap.set(mode, keys, func, opts)
end

M.nmap = function(keys, func, desc, opts)
  M.map("n", keys, func, desc, opts)
end

return M
