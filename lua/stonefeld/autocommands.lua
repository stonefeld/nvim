-- ---------- Autocommands ---------- --
-- Set different options and keymaps according to each filetype
vim.cmd [[
  aug filetype_based_changes
    au!
    au TermOpen term://* setl ft=term
    au TermClose term://* exe "bd | lua Statusline('active')"
    au BufNewFile,BufRead *.tex setl ft=tex
    au BufNew,BufRead,BufEnter *.asm setl ft=nasm
    au BufNew,BufRead,BufEnter *.rasi setl ft=rasi
  aug end
]]

-- Clean and format the current buffer.
vim.cmd [[
  fu! FormatCode()
    exe '%s/if(/if (/e'
    exe '%s/for(/for (/e'
    exe '%s/while(/while (/e'
    exe '%s/switch(/switch (/e'
    exe '%s/}break;/} break;/e'
  endfu

  aug clean_buffer
    au!
    au BufWritePre * %s/\s\+$//e
    au FileType c,cpp au BufWritePre <buffer> call FormatCode()
  aug end
]]

-- Get visual feedback when a line or region was yanked.
vim.cmd[[
  aug visual_yank
    au!
    au TextYankPost * silent! lua require('vim.highlight').on_yank({timeout = 100})
  aug end
]]
