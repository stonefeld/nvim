-- ---------- Autocommands ---------- --
-- Define a shorten function
local aug = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

-- Set different options and keymaps according to each filetype
local filetype_based_changes = aug("filetype_based_changes", { clear = true })
au("TermOpen", {
  pattern = "term://*",
  command = [[ setl ft=term ]],
  group = filetype_based_changes
})
au("TermClose", {
  pattern = "term://*",
  command = "bd | lua Statusline('active')",
  group = filetype_based_changes
})
au({ "BufNewFile", "BufRead" }, {
  pattern = "*.tex",
  command = [[ setl ft=tex ]],
  group = filetype_based_changes
})
au({ "BufNew", "BufRead", "BufEnter" }, {
  pattern = "*.asm",
  command = [[ setl ft=nasm ]],
  group = filetype_based_changes
})
au({ "BufNew", "BufRead", "BufEnter" }, {
  pattern = "*.rasi",
  command = [[ setl ft=rasi ]],
  group = filetype_based_changes
})

-- Clean and format the current buffer.
local clean_buffer = aug("clean_buffer", { clear = true })
au("BufWritePre", {
  buffer = 0,
  group = clean_buffer,
  callback = function()
    vim.cmd [[ exe '%s/\s\+$//e' ]]
  end
})
au("BufWritePre", {
  pattern = { "*.c", "*.cpp" },
  group = clean_buffer,
  callback = function()
    vim.cmd [[ exe '%s/if(/if (/e' ]]
    vim.cmd [[ exe '%s/for(/for (/e' ]]
    vim.cmd [[ exe '%s/while(/while (/e' ]]
    vim.cmd [[ exe '%s/switch(/switch (/e' ]]
    vim.cmd [[ exe '%s/}break;/} break;/e' ]]
  end
})

-- Windows to close with 'q'
local close_win = aug("close_win", { clear = true })
au("FileType", {
  pattern = { "help", "qf", "lspinfo" },
  command = [[ nnoremap <buffer><silent> q :close<CR> ]],
  group = close_win
})

-- Get visual feedback when a line or region was yanked.
local visual_yank = aug("visual_yank", { clear = true })
au("TextYankPost", {
  group = visual_yank,
  callback = function()
    require('vim.highlight').on_yank({ timeout = 150 })
  end
})
