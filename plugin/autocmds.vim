" ---------- Autocommands ---------- "
" Specify settings to the corresponding filetypes.
aug FiletypeSpecific
  au!

  " Set different tab width for the following filetypes.
  au FileType css,html,htmldjango,javascript,javascriptreact,json,jsonc,markdown,tex,typescript,typescriptreact,vim,yaml au WinEnter,BufEnter <buffer> setlocal tabstop=2 shiftwidth=2 expandtab
  au FileType tex nnoremap <M-m> :w! \| execute '!compiler ' . expand('%:p')<CR>
  au FileType markdown nnoremap <M-m> :w! \| silent execute '!compiler ' . expand('%:p') \| redraw!<CR>
  au FileType tex,markdown nnoremap <silent> <M-o> :silent execute '!xdg-open ' . expand('%:r') . '.pdf &' \| redraw!<CR>

  " Disable scrolloff on terminal to avoid glitch.
  au TermOpen term://* setlocal ft=term
  au Filetype term setlocal scrolloff=0 sidescrolloff=0 nonu norelativenumber wrap scrollback=5000 signcolumn=no colorcolumn=0

  " Avoid 'plaintex' filetype.
  au BufNewFile,BufRead *.tex setlocal filetype=tex

  " Set filetype for assembler.
  au BufNew,BufRead,BufEnter *.asm setlocal ft=nasm
aug END

" Format c/cpp code to get a consistent style.
fu! FormatCode()
  exe '%s/if(/if (/e'
  exe '%s/for(/for (/e'
  exe '%s/while(/while (/e'
  exe '%s/switch(/switch (/e'
  exe '%s/}break;/} break;/e'
  exe '%s/){/) {/e'
endfu

" Clean and format the current buffer.
aug CleanBuffer
  au!

  " Delete all whitespace in buffer.
  au BufWritePre * %s/\s\+$//e

  " Format c/cpp code to get a consistent style.
  au FileType c,cpp au BufWritePre <buffer> call FormatCode()
aug END

" Get visual feedback when a line or region was yanked.
aug VisualYank
  au!

  " Higlight the line for a short period of time to indicate yanked line.
  au TextYankPost * silent! lua require('vim.highlight').on_yank({timeout = 100})
aug END
