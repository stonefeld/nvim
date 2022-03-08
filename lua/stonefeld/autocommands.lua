-- ---------- Autocommands ---------- --
-- Set different options and keymaps according to each filetype
local filetype_based_changes = vim.api.nvim_create_augroup("filetype_based_changes", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", { pattern = "term://*", command = "setl ft=term", group = filetype_based_changes })
vim.api.nvim_create_autocmd("TermClose", { pattern = "term://*", command = "bd | lua Statusline('active')", group = filetype_based_changes })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = "*.tex", command = "setl ft=tex", group = filetype_based_changes })
vim.api.nvim_create_autocmd({ "BufNew", "BufRead", "BufEnter" }, { pattern = "*.asm", command = "setl ft=nasm", group = filetype_based_changes })
vim.api.nvim_create_autocmd({ "BufNew", "BufRead", "BufEnter" }, { pattern = "*.rasi", command = "setl ft=rasi", group = filetype_based_changes })

-- Clean and format the current buffer.
local clean_buffer = vim.api.nvim_create_augroup("clean_buffer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", { buffer = 0, group = clean_buffer, callback = function()
  vim.cmd [[ exe '%s/\s\+$//e' ]]
end })
vim.api.nvim_create_autocmd("BufWritePre", { pattern = { "*.c", "*.cpp" }, group = clean_buffer, callback = function()
  vim.cmd [[ exe '%s/if(/if (/e' ]]
  vim.cmd [[ exe '%s/for(/for (/e' ]]
  vim.cmd [[ exe '%s/while(/while (/e' ]]
  vim.cmd [[ exe '%s/switch(/switch (/e' ]]
  vim.cmd [[ exe '%s/}break;/} break;/e' ]]
end })

-- Get visual feedback when a line or region was yanked.
local visual_yank = vim.api.nvim_create_augroup("visual_yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", { group = visual_yank, callback = function()
  require('vim.highlight').on_yank({ timeout = 150 })
end})
