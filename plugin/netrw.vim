" ---------- Netrw ---------- "
" Disable Netrw default 'help message'.
let g:netrw_banner=0

" Change netrw window size.
let g:netrw_winsize=25

" Disable .netrwhist file by setting max directory history to 0.
let g:netrw_dirhistmax=0

" Customize keybindings on netrw window.
fu! NetrwMapping()
  nmap <silent> <buffer> H u
  nmap <silent> <buffer> h -^
  nmap <silent> <buffer> l <CR>
  nmap <silent> <buffer> . gh
  nmap <silent> <buffer> L <CR>:Lexplore<CR>
endfu

aug NetrwKeybindings
  au!
  au FileType netrw call NetrwMapping()
aug END
