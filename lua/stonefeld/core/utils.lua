local M = {}

M.map = function(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { noremap = true, silent = true, desc = desc or "" })
end

M.nmap = function(keys, func, desc)
  M.map("n", keys, func, desc)
end

return M
