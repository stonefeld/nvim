" ---------- Autocommands ---------- "
augroup AUTOCOMMANDS
  autocmd!

  " Set different tab width for the following filetypes.
  autocmd FileType css,html,javascript,javascriptreact,json,jsonc,markdown,tex,typescript,typescriptreact,vim,yaml setlocal tabstop=2 shiftwidth=2
  autocmd FileType html nnoremap <silent> <F5> :execute 'silent !xdg-open %'<CR>
  autocmd FileType markdown nnoremap <silent> <F5> :MarkdownPreviewToggle<CR>
  autocmd FileType tex setlocal wrap
  autocmd FileType tex nnoremap <silent> <F5> :VimtexCompile<CR>

  " Higlight the line for a short period of time to indicate yanked line.
  autocmd TextYankPost * silent! lua require('vim.highlight').on_yank({timeout = 40})

  " Clean every whitespace before writing.
  autocmd BufWritePre * %s/\s\+$//e

  " Disable scrolloff on terminal to avoid glitch.
  autocmd TermEnter * set scrolloff=0
  autocmd TermEnter * set sidescrolloff=0
  autocmd TermEnter * set nocursorline
  autocmd TermEnter * set nonu
  autocmd TermEnter * set norelativenumber
  autocmd TermEnter * set scrollback=458
  autocmd TermLeave * set scrolloff=8
  autocmd TermLeave * set sidescrolloff=8
  autocmd TermLeave * set cursorline
  autocmd TermLeave * set nu
  autocmd TermLeave * set relativenumber
augroup END
