" ---------- Autocommands ---------- "
augroup MyAutocommands
  autocmd!

  " Set different tab width for the following filetypes.
  autocmd FileType css,html,htmldjango,javascript,javascriptreact,json,jsonc,markdown,tex,typescript,typescriptreact,vim,yaml setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType html nnoremap <silent> <F5> :execute 'silent !xdg-open %'<CR>
  autocmd FileType tex,markdown,mail setlocal wrap nonu norelativenumber scrolloff=0 signcolumn=no colorcolumn=0
  autocmd FileType tex,markdown nnoremap j gj
  autocmd FileType tex,markdown nnoremap k gk
  autocmd FileType tex,markdown nnoremap 0 g0
  autocmd FileType tex,markdown nnoremap $ g$
  autocmd FileType tex nnoremap <leader>st :w! \| execute '!compiler ' . expand('%:p')<CR>
  autocmd FileType markdown nnoremap <leader>st :w! \| silent execute '!compiler ' . expand('%:p') \| redraw!<CR>
  autocmd FileType tex,markdown nnoremap <silent> <leader>so :silent execute '!${PDF_READER:-zathura} ' . expand('%:r') . '.pdf &' \| redraw!<CR>

  " Higlight the line for a short period of time to indicate yanked line.
  autocmd TextYankPost * silent! lua require('vim.highlight').on_yank({timeout = 100})

  " Clean every whitespace before writing.
  autocmd BufWritePre * %s/\s\+$//e

  " Disable scrolloff on terminal to avoid glitch.
  autocmd TermEnter * set scrolloff=0 sidescrolloff=0 nonu norelativenumber scrollback=500
  autocmd TermLeave * set scrolloff=8 sidescrolloff=8 nu relativenumber

  " Avoid 'plaintex' filetype.
  autocmd BufNewFile,BufRead *.tex :set filetype=tex

  " Set filetype for assembler.
  autocmd BufNew,BufRead,BufEnter *.asm set ft=nasm
  autocmd BufNew,BufRead,BufEnter *.asm setlocal tabstop=8 shiftwidth=8 listchars=tab:\ \ ,trail:.,eol:$

  " Get git branch name on statusline.
  autocmd BufEnter * call GetGitBranch()
augroup END
