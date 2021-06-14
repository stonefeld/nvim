" ---------- Terminal ---------- "
" Goto to the corresponding terminal buffer.
nmap <leader>tj :call GoToBuffer(0)<CR>
nmap <leader>tk :call GoToBuffer(1)<CR>
nmap <leader>tl :call GoToBuffer(2)<CR>
nmap <leader>t; :call GoToBuffer(3)<CR>

" Set terminal buffer shortcut.
nmap <leader>tsj :call SetBuffer(0)<CR>
nmap <leader>tsk :call SetBuffer(1)<CR>
nmap <leader>tsl :call SetBuffer(2)<CR>
nmap <leader>ts; :call SetBuffer(3)<CR>

" Open different instances of neovim terminal.
nnoremap <leader>tt :terminal<CR>
nnoremap <leader>tg :terminal lazygit<CR>
