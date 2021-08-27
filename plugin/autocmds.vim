" ---------- Autocommands ---------- "
augroup AUTOCOMMANDS
  autocmd!

  " Set different tab width for the following filetypes.
  autocmd FileType css,html,javascript,javascriptreact,json,jsonc,markdown,tex,typescript,typescriptreact,vim,yaml setlocal tabstop=2 shiftwidth=2
  autocmd FileType html nnoremap <silent> <F5> :execute 'silent !xdg-open %'<CR>
  autocmd FileType tex,markdown,mail setlocal wrap nonu norelativenumber showmode scrolloff=0 laststatus=0 signcolumn=no colorcolumn=0
  autocmd FileType tex,markdown,mail call compe#setup({'enabled': v:false})
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
  autocmd TermLeave * set scrolloff=8 sidescrolloff=8 cursorline nu relativenumber

  " Avoid 'plaintex' filetype.
  autocmd BufNewFile,BufRead *.tex :set filetype=tex

  autocmd BufEnter * call GetGitBranch()
augroup END
