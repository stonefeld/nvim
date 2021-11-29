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
