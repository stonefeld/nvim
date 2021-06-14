" ---------- FZF ---------- "
" Keybindings.
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <leader>pa :Buffers<CR>
nnoremap <silent> <leader>pd :Diagnostics<CR>

" General setup.
let g:fzf_layout={ 'window': { 'width': 0.8, 'height': 0.75 } }
let g:fzf_preview_window=[ 'down:40%:hidden', '?' ]
let $FZF_DEFAULT_OPTS='--info=inline --layout=reverse'
let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude={.git,.venv,node_modules}'
