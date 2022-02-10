-- ---------- Autocommands ---------- --
-- Set different options and keymaps according to each filetype
vim.cmd [[
    aug filetype_based_changes
        au!
        au FileType css,html,htmldjango,javascript,javascriptreact,json,jsonc,markdown,tex,typescript,typescriptreact,vim,yaml au WinEnter,BufEnter <buffer> setl tabstop=2 shiftwidth=2 expandtab
        au FileType markdown,tex au WinEnter,BufEnter <buffer> setl tw=80
        au FileType tex nnoremap <M-m> :w! \| execute '!compiler ' . expand('%:p')<CR>
        au FileType markdown nnoremap <silent> <M-m> :w! \| silent execute '!md-to-pdf ' . expand('%:p') \| redraw!<CR>
        au FileType tex,markdown nnoremap <silent> <M-o> :silent execute '!xdg-open ' . expand('%:r') . '.pdf &' \| redraw!<CR>
        au TermOpen term://* setl ft=term
        au TermClose term://* exe "bd | lua Statusline('active')"
        au Filetype term setl scrolloff=0 sidescrolloff=0 nonu norelativenumber wrap scrollback=5000 signcolumn=no colorcolumn=0
        au BufNewFile,BufRead *.tex setl ft=tex
        au BufNew,BufRead,BufEnter *.asm setl ft=nasm
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
