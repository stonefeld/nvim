" ---------- Ctrl-P ---------- "
" Basic configuration.
let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Keybindings.
nnoremap <silent> <C-p> :CtrlP<CR>
nnoremap <silent> <leader>pa :CtrlPBuffer<CR>
