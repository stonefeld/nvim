" ---------- LSP ---------- "
" Autocomplete options.
set complete+=kspell
set completeopt=menuone,noinsert,noselect,preview

" Set python path.
if filereadable('$PYENV_ROOT/versions/neovim3.9.1/bin/python')
  let g:python3_host_prog='$PYENV_ROOT/versions/neovim3.9.1/bin/python'
endif
if filereadable('$PYENV_ROOT/versions/neovim2.7.18/bin/python')
  let g:python_host_prog='$PYENV_ROOT/versions/neovim2.7.18/bin/python'
endif

" Keybindings.
nnoremap <silent> gD :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <C-]> :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>D :lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>ca :lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>ld :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> [d :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]d :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>q :lua vim.lsp.diagnostic.set_loclist()<CR>
