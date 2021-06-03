" ---------- LSP Compe ---------- "
" Keybindings.
inoremap <silent><expr> <C-o> compe#complete()
inoremap <silent><expr> <CR> compe#confirm('<CR>')

" General setup.
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.documentation = v:true

" Sources setup.
let g:compe.source = {}
let g:compe.source.path=v:true
let g:compe.source.buffer=v:true
let g:compe.source.nvim_lsp=v:true
let g:compe.source.nvim_lua=v:true
let g:compe.source.ultisnips=v:true
