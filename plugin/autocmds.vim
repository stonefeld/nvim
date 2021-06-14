" ---------- Autocommands ---------- "
" Higlight the line for a short period of time to indicate yanked line.
augroup HighlightYank
    autocmd!
    autocmd TextYankPost * silent! lua require('vim.highlight').on_yank({timeout = 40})
augroup END

" Clean every whitespace before writing.
augroup CleanWhitespace
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
augroup END

" Disable scrolloff on terminal to avoid glitch.
augroup Terminal
  autocmd!

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
